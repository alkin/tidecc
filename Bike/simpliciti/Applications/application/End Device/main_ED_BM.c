
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
extern void Timer0_A4_Delay(u16 ticks);
extern void simpliciti_watch_decode_bike_callback(void);

// *************************************************************************************************
// Global Variable section

static void show(uint8_t mode);

static          linkID_t sLinkID3 = 0;
static volatile uint8_t  sSemaphore = 0;

/* Rx callback handler */
static uint8_t Link_Callback(linkID_t);


unsigned char simpliciti_link_to (void)
{
  //show(1);  // listening - lis/
  //show(2);  // linking - lin 
  //show(3);  // connected - con
  //BSP_Init();
  BSP_InitBoard();
  
  SMPL_Init(Link_Callback);
  
  uint8_t pwr;
  
  pwr = IOCTL_LEVEL_2;
  SMPL_Ioctl(IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SETPWR, &pwr); 
  uint8_t aux;
  uint8_t timeout=160;

  while (1)
  //for (aux=0;aux<=timeout;aux++)
  {
     if (SMPL_SUCCESS == SMPL_Link(&sLinkID3))
	 {
	    break;
        //SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXIDLE, 0);
        //SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
        
	    //NWK_DELAY(250);
	    // Service watchdog
		//SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
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

void bike_communication()
{
  // show(3); // connected
   /* turn on RX. default is RX off. */
   /* turn on RX. default is RX off. */
   SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
   SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);

   while (1)
   {
	  if (getFlag(simpliciti_bike_flag, SIMPLICITI_BIKE_TRIGGER_SEND_DATA)) 
	  {
	     if (sSemaphore)
	     {
	       // answer to received message
	       simpliciti_bike_get_data_callback();
	       SMPL_Send(sLinkID3, simpliciti_data, BIKE_DATA_LENGTH);
	       sSemaphore = 0;
	     }
	  }
     if (getFlag(simpliciti_bike_flag, SIMPLICITI_BIKE_TRIGGER_STOP)) 
	  {
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

// LCD messages
void show(uint8_t mode) 
{ 
  // 0 hi earth
  // 1 listening
  // 2 linking
  // 3 ok
  // 4 message
  
    unsigned char * lcdmem; 
    // clear line    
    LCDBMEMCTL |= LCDCLRBM + LCDCLRM; 

    // LCD_FREQ = ACLK/16/8 = 256Hz 
    // Frame frequency = 256Hz/4 = 64Hz, LCD mux 4, LCD on 
    LCDBCTL0 = (LCDDIV0 + LCDDIV1 + LCDDIV2 + LCDDIV3) | (LCDPRE0 + LCDPRE1) | LCD4MUX | LCDON; 
    // LCB_BLK_FREQ = ACLK/8/4096 = 1Hz 
    LCDBBLKCTL = LCDBLKPRE0 | LCDBLKPRE1 | LCDBLKDIV0 | LCDBLKDIV1 | LCDBLKDIV2 | LCDBLKMOD0;  
    // I/O to COM outputs 
    P5SEL |= (BIT5 | BIT6 | BIT7); 
    P5DIR |= (BIT5 | BIT6 | BIT7); 
        
    // Activate LCD output 
    LCDBPCTL0 = 0xFFFF;  // Select LCD segments S0-S15 
    
    LCDBPCTL1 = 0x00FF;  // Select LCD segments S16-S22 
    
    if(mode == 0)
    {
  //    LCD_B Base Address is 0A00H page 30 y in SALS554 document 
    //show h 
     lcdmem = (unsigned char *)0x0A21; 
    (*lcdmem) = (unsigned char)(*lcdmem | (BIT2+BIT1+BIT6+BIT0)); 
    // show 'i' 
    lcdmem  = (unsigned char *)0x0A22; 
    
    *lcdmem = (unsigned char)(*lcdmem | (BIT2)); 
    // show 'E' 
    lcdmem  = (unsigned char *)0x0A2B; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT5+BIT6+BIT0+BIT3)); 
        
    // show 'A' 
    lcdmem  = (unsigned char *)0x0A2A; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT0+BIT1+BIT2+BIT4+BIT5+BIT6)); 
    
    // show 'r' 
    lcdmem  = (unsigned char *)0x0A29; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT6+BIT5)); 
    
    // show 't' 
    
    lcdmem  = (unsigned char *)0x0A28; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT5+BIT6+BIT3)); 
    
    // show 'h' 
    lcdmem  = (unsigned char *)0x0A27; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT5+BIT6+BIT2)); 
    
    __no_operation();  // For debugger 
    }
    
   else if(mode ==1)
    {
   // L
    lcdmem  = (unsigned char *)0x0A2B; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT3 + BIT6 + BIT4)); 
    
    // i
    
    lcdmem  = (unsigned char *)0x0A2A; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT6)); 
    
    // S
    lcdmem  = (unsigned char *)0x0A29; 
    *lcdmem = (unsigned char)(*lcdmem | (BIT0+BIT2+BIT4+BIT5+BIT3)); 
    __no_operation();  // For debugger                        
    } 
     else if(mode ==2) // LINKING
    {  
      // L
     lcdmem  = (unsigned char *)0x0A2B; 
     *lcdmem = (unsigned char)(*lcdmem | (BIT3 + BIT6 + BIT4)); 
      // I
      lcdmem  = (unsigned char *)0x0A2A; 
     *lcdmem = (unsigned char)(*lcdmem | (BIT6)); 
      
      // N
     lcdmem  = (unsigned char *)0x0A29; 
      *lcdmem = (unsigned char)(*lcdmem | (BIT2+BIT5+BIT6)); 
      __no_operation();  // For debugger        
    } 
      else if(mode ==3) // CONNECTED
    {
        // C
         lcdmem  = (unsigned char *)0x0A2B; 
        *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT3+BIT6+BIT0)); 
        
         // O
         lcdmem  = (unsigned char *)0x0A2A; 
         *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT3+BIT6+BIT0+BIT2+BIT1)); 
        
         // N        
         lcdmem  = (unsigned char *)0x0A29; 
         *lcdmem = (unsigned char)(*lcdmem | (BIT2+BIT5+BIT6)); 
         __no_operation();  // For debugger        
    } 
     else if(mode ==4) // Message
    {
           // B
         lcdmem  = (unsigned char *)0x0A2B; 
        *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT3+BIT6+BIT0+BIT2+BIT1+BIT5)); 
        
         // i
         lcdmem  = (unsigned char *)0x0A2A; 
         *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT6)); 
        
         // T        
         lcdmem  = (unsigned char *)0x0A29; 
         *lcdmem = (unsigned char)(*lcdmem | (BIT4+BIT3+BIT6+BIT5)); 
         __no_operation();  // For debugger 
    } 
}

