
// *************************************************************************************************
// Include section
#include "bsp.h"
#include "mrfi.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "simpliciti.h"

// *************************************************************************************************
// Defines section
#define TIMEOUT					(10u)

// Conversion from msec to ACLK timer ticks
#define CONV_MS_TO_TICKS(msec)         			(((msec) * 32768) / 1000) 

#define SPIN_ABOUT_A_SECOND  NWK_DELAY(1000)

// U16
typedef unsigned short u16;

// *************************************************************************************************
// Prototypes section

// *************************************************************************************************
// Extern section
extern uint8_t sInit_done;

// SimpliciTI has no low power delay function, so we have to use ours

//extern void simpliciti_watch_decode_bike_callback(void);

// *************************************************************************************************
// Global Variable section
static          linkID_t sLinkID3 = 0;
static volatile uint8_t  sSemaphore = 0;

/* Rx callback handler */
static uint8_t Link_Callback(linkID_t);

unsigned char simpliciti_link_to (void)
{
  BSP_InitBoard();
  
  SMPL_Init(Link_Callback);
  
  uint8_t pwr;
  
  pwr = IOCTL_LEVEL_2;
  SMPL_Ioctl(IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SETPWR, &pwr); 

  while (1)
  {
     if (SMPL_SUCCESS == SMPL_Link(&sLinkID3))
	 {
	    break;
     }
       
      else if(simpliciti_bike_flag == SIMPLICITI_BIKE_TRIGGER_STOP)
	  {
	     simpliciti_bike_flag = SIMPLICITI_BIKE_STATUS_ERROR;
	     return (0);
	  }
  	WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
  }
  
  simpliciti_bike_flag = SIMPLICITI_BIKE_STATUS_LINKED;
  return (1);
}

void simpliciti_bike_communication()
{
  // turn on RX. default is RX off.
   
   SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
   SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);
   while (1)
   {
   	  // if it received request from watch
	  if (sSemaphore)
	  {
	      // answer to received message
	      simpliciti_bike_get_data_callback();
	      
	      if(simpliciti_data[0] == BIKE_CMD_DATA)
	      {
     		// send twice since we don't receive ACK as confirmation 
     	    SMPL_Send(sLinkID3, simpliciti_data, BIKE_DATA_LENGTH);
	        NWK_DELAY(15);
	       
	        SMPL_Send(sLinkID3, simpliciti_data, BIKE_DATA_LENGTH);
	        NWK_DELAY(15);  
           }
	      // if it is the message is a config ACK the message size is one
	      else if(simpliciti_data[0] == BIKE_CMD_CONFIG)
	      {
	      	 sSemaphore=0;
	      	 // send twice since we don't receive ACK as confirmation 
	         SMPL_Send(sLinkID3, simpliciti_data, 4);
	         NWK_DELAY(10);
	         
	         SMPL_Send(sLinkID3, simpliciti_data, 4);
	         NWK_DELAY(10);
             
             break;
	      }
	      
	      else if(simpliciti_data[0] == BIKE_CMD_EXIT)
	      {
	      	  // if it send everything, send message to watch to disconnect
	      	
	      	 SMPL_Send(sLinkID3, simpliciti_data, 4);
	         NWK_DELAY(10);
	         
	         SMPL_Send(sLinkID3, simpliciti_data, 4);
	         NWK_DELAY(10);
            
	          sSemaphore = 0;
	          break;
	      }
	  }
	 // if the timer decides it is time to stop
     if (getFlag(simpliciti_bike_flag, SIMPLICITI_BIKE_TRIGGER_STOP)) 
	  {
	  	sSemaphore = 0;
	    break;
	  }
      // Service watchdog
	  WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;        
   }
   	         
       // Get radio ready. Wakes up in IDLE state.
	      SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXIDLE, 0);
	  
	   // Put radio back to SLEEP state
	      SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
}

/* handle received frames. */
static uint8_t Link_Callback(linkID_t port)
{
  uint8_t len;

  /* is the callback for the link ID we want to handle? */
  if (port == sLinkID3)
  {
    /* yes. go get the frame. we know this call will succeed. */
     if ((SMPL_SUCCESS == SMPL_Receive(sLinkID3, simpliciti_data, &len)) && len)
     {   
       	
       simpliciti_bike_decode_watch_callback();
       sSemaphore = 1;
       return 1;
     }
  }
  /* keep frame for later handling. */
  return 0;
}

void reset_simpliciti(void)
{
 	sInit_done = 0;
}
