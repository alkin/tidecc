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
static linkID_t sLinkID1;

uint8_t bike_try;

static void show(uint8_t mode);

static          linkID_t sLinkID3 = 0;
static volatile uint8_t  sSemaphore = 0;

/* Rx callback handler */
static uint8_t Listen_Callback(linkID_t);


// *************************************************************************************************
// @fn          simpliciti_link
// @brief       Init hardware and try to link to access point.
// @param       none
// @return      unsigned char		0 = Could not link, timeout or external cancel.
//									1 = Linked successful.
// *************************************************************************************************
unsigned char simpliciti_link(void)
{
  uint8_t timeout;
  addr_t lAddr;
  uint8_t i;
  uint8_t pwr;
  
  // Configure timer
  BSP_InitBoard();
  
  // Change network address to value set in calling function
  for (i=0; i<NET_ADDR_SIZE; i++)
  {
    lAddr.addr[i] = simpliciti_ed_address[i];
  }
  SMPL_Ioctl(IOCTL_OBJ_ADDR, IOCTL_ACT_SET, &lAddr);
  
  // Set flag	
  simpliciti_flag = SIMPLICITI_STATUS_LINKING;	
	
  /* Keep trying to join (a side effect of successful initialization) until
   * successful. Toggle LEDS to indicate that joining has not occurred.
   */
  timeout = 0;
  while (SMPL_SUCCESS != SMPL_Init(0))
  {
    NWK_DELAY(1000);

    // Service watchdog
	WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
    
    // Stop connecting after defined numbers of seconds (15)
    if (timeout++ > TIMEOUT)
    {
		// Clean up SimpliciTI stack to enable restarting
  		sInit_done = 0;
	    simpliciti_flag = SIMPLICITI_STATUS_ERROR;
  		return (0);
    }
    
    // Break when flag bit SIMPLICITI_TRIGGER_STOP is set
    if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_STOP))
    {
		// Clean up SimpliciTI stack to enable restarting
    	sInit_done = 0;
    	return (0);
	}
  }
  
  // Set output power to +3.3dmB
  pwr = IOCTL_LEVEL_2;
  SMPL_Ioctl(IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SETPWR, &pwr);

  /* Unconditional link to AP which is listening due to successful join. */
  timeout = 0;
  while (SMPL_SUCCESS != SMPL_Link(&sLinkID1))
  {
    NWK_DELAY(1000);
    
    // Service watchdog
	WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;

    // Stop linking after timeout
    if (timeout++ > TIMEOUT) 
    {
		// Clean up SimpliciTI stack to enable restarting
  		sInit_done = 0;
	    simpliciti_flag = SIMPLICITI_STATUS_ERROR;
  		return (0);
    }
    
    // Exit when flag bit SIMPLICITI_TRIGGER_STOP is set
    if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_STOP)) 
    {
    	// Clean up SimpliciTI stack to enable restarting
    	sInit_done = 0;
    	return (0); 
	}
  }
  simpliciti_flag = SIMPLICITI_STATUS_LINKED;
  
  return (1);
}

// *************************************************************************************************
// @fn          simpliciti_main_tx_only
// @brief       Get data through callback. Transfer data when external trigger is set.
// @param       none
// @return      none
// *************************************************************************************************
void simpliciti_main_tx_only(void)
{
  while(1)
  {
    // Get end device data from callback function 
    simpliciti_get_ed_data_callback();
    
    // Send data when flag bit SIMPLICITI_TRIGGER_SEND_DATA is set
    if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_SEND_DATA)) 
    {
      // Get radio ready. Wakes up in IDLE state.
      SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
      
      // Acceleration / button events packets are 4 bytes long
      SMPL_SendOpt(sLinkID1, simpliciti_data, 4, SMPL_TXOPTION_NONE);
      
      // Put radio back to SLEEP state
      SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
      
      clearFlag(simpliciti_flag, SIMPLICITI_TRIGGER_SEND_DATA);
    }
    
    // Exit when flag bit SIMPLICITI_TRIGGER_STOP is set
    if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_STOP)) 
    {
      	// Clean up SimpliciTI stack to enable restarting
    	sInit_done = 0;
	    break;
	}
  }
  	SMPL_Unlink(sLinkID1);
  	simpliciti_flag = 0x00;
}

// *************************************************************************************************
// @fn          simpliciti_main_sync
// @brief       Send ready-to-receive packets in regular intervals. Listen shortly for host reply.
//				Decode received host command and trigger action. 
// @param       none
// @return      none
// *************************************************************************************************
void simpliciti_main_sync(void)
{
	uint8_t len, i;
	uint8_t ed_data[2];
	
	while(1)
	{
		// Sleep 0.5sec between ready-to-receive packets
		// SimpliciTI has no low power delay function, so we have to use ours
		Timer0_A4_Delay(CONV_MS_TO_TICKS(500));
		
		// Get radio ready. Radio wakes up in IDLE state.
      	SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
		
		// Send 2 byte long ready-to-receive packet to stimulate host reply
		ed_data[0] = SYNC_ED_TYPE_R2R;
		ed_data[1] = 0xCB;
		SMPL_SendOpt(sLinkID1, ed_data, 2, SMPL_TXOPTION_NONE);
		
		// Wait shortly for host reply
		SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);
		NWK_DELAY(10);
  	
		// Check if a command packet was received
		while (SMPL_Receive(sLinkID1, simpliciti_data, &len) == SMPL_SUCCESS)
		{
 			// Decode received data
			if (len > 0)
			{
				// Use callback function in application to decode data and react
				simpliciti_sync_decode_ap_cmd_callback();
				
				// Get reply data and send out reply packet burst (19 bytes each)
				for (i=0; i<simpliciti_reply_count; i++)
				{
					NWK_DELAY(10);
					simpliciti_sync_get_data_callback(i);
					SMPL_SendOpt(sLinkID1, simpliciti_data, BM_SYNC_DATA_LENGTH, SMPL_TXOPTION_NONE);
				}
			}
  		}

		// Put radio back to sleep  		
  		SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
  		
  		// Service watchdog
		WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
  		
		// Exit when flag bit SIMPLICITI_TRIGGER_STOP is set
		if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_STOP)) 
		{
			// Clean up SimpliciTI stack to enable restarting
			sInit_done = 0;
			break;
		}
	}
	simpliciti_flag = 0x00;
	SMPL_Unlink(sLinkID1);
	//SMPL_Ioctl(IOCTL_OBJ_CONNOBJ,IOCTL_ACT_DELETE,&linkID). 
}


unsigned char simpliciti_listen_to(void)
{
  uint8_t pwr;
	
//  BSP_Init();
  BSP_InitBoard();

//registers 
    RF1AIFCTL0 = 0x0000;
	RF1AIFCTL1 = 0x0070;
	RF1AIFCTL2 = 0x0000;
	RF1AIFERR = 0x0000;
	RF1AIFERRV = 0x0000;
	RF1AIFIV = 0x0000;
	RF1AINSTRW = 0x4029;
	RF1AINSTR1W = 0x4000;
	RF1AINSTR2W = 0x4000;
	RF1ADINW = 0x4029;
	RF1ASTAT0W = 0x0F2E;
	RF1ASTAT1W = 0x0F2E;
	RF1ASTAT2W = 0x0F2E;
	RF1ADOUT0W = 0x002E;
	RF1ADOUT1W = 0x002E;
	RF1ADOUT2W = 0x002E;
	RF1AIN = 0x0000;
	RF1AIFG = 0x0004;
	RF1AIES = 0x0000;
	RF1AIE = 0x0010;
	RF1AIV = 0x0000;
	RF1ARXFIFO = 0x0000;
	RF1ATXFIFO = 0x0000;

#ifdef energy
   // wait some seconds for the bike to get enough energy
   Timer0_A4_Delay(1000);
   Timer0_A4_Delay(1000);
   Timer0_A4_Delay(1000);
   Timer0_A4_Delay(1000);
   Timer0_A4_Delay(1000);
#endif

  // Set flag	
  simpliciti_flag = SIMPLICITI_STATUS_LINKING;

  SMPL_Init(Listen_Callback);
   
   pwr = IOCTL_LEVEL_2;
  //pwr = IOCTL_LEVEL_1;
  SMPL_Ioctl(IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SETPWR, &pwr);
  
  while (1)
  {
  	// Service watchdog
	WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
  	
	if (SMPL_SUCCESS == SMPL_LinkListen(&sLinkID3))
    {
      break;
    }  
    
    // Break when flag bit SIMPLICITI_TRIGGER_STOP is set
    if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_STOP)) 
    {
		// Clean up SimpliciTI stack to enable restarting
    	sInit_done = 0;
    	return (0);
	}
  }
  
    SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXIDLE, 0);
	// Put radio back to sleep  		
  	SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
  		
    simpliciti_flag = SIMPLICITI_STATUS_LINKED;
    // show connected

    return (1);
}

void listen()
{
   uint8_t len;
   // Connected

// sleep here for a while, letting the bike recover some energy
 //Timer0_A4_Delay(1000);
 //Timer0_A4_Delay(1000);
 //Timer0_A4_Delay(1000);

// Config loop

		// Wait shortly for host reply
      	SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
		SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);
        simpliciti_data[0] = WATCH_CMD_SET_CONFIG; 
//      simpliciti_watch_decode_bike_callback();
        simpliciti_watch_get_data_callback();
      while(simpliciti_data[0] != BIKE_CMD_CONFIG)
      {
      	  SMPL_Send(sLinkID3, simpliciti_data, BIKE_DATA_LENGTH);
      	  bike_try++;
          NWK_DELAY(10);
      	  // Service watchdog
	      WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
      }
      
        SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXIDLE, 0);
		// Put radio back to sleep  		
  		SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
	 
        SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);	
        SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);
       
       Timer0_A4_Delay(1000);
       Timer0_A4_Delay(1000);
       Timer0_A4_Delay(1000);
// Get data loop
   while (1)
   {
  //	if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_SEND_DATA)) 
    //{
	   // Get radio ready. Radio wakes up in IDLE state.

      NWK_DELAY(800);
      simpliciti_data[0] = WATCH_CMD_GET_DATA;      
     // while(simpliciti_data[0] != BIKE_CMD_DATA)
      //{
      	  SMPL_Send(sLinkID3, simpliciti_data,BIKE_DATA_LENGTH);      	  
//          NWK_REPLY_DELAY();
      	  NWK_DELAY(10);
      	  //bike_try++;
      	  //NWK_DELAY(10);
      	  // Service watchdog
	   //   WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
      //}
     if (simpliciti_data[0] != BIKE_CMD_DATA)
      {
         show(2);
      }
    /*   simpliciti_data[0]= WATCH_CMD_EXIT;
     while(simpliciti_data[0] != BIKE_CMD_DATA)
      {
        SMPL_Send(sLinkID3, simpliciti_data, BIKE_DATA_LENGTH);
        NWK_DELAY(10);
      }
      */   
        //SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXIDLE, 0);
     	// Put radio back to sleep  		
  		//SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
  		//simpliciti_flag = SIMPLICITI_TRIGGER_STOP;
        // clearFlag(simpliciti_flag, SIMPLICITI_TRIGGER_SEND_DATA);
    //}
     	
	    // Service watchdog
		WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;

		// Break when flag bit SIMPLICITI_TRIGGER_STOP is set
        if (getFlag(simpliciti_flag, SIMPLICITI_TRIGGER_STOP)) 
        {
		   break;
	    }
   }
  
  sInit_done = 0;  
  SMPL_Unlink(sLinkID3);
}

/* handle received messages */
static uint8_t Listen_Callback(linkID_t port)
{
  uint8_t len;
  /* is the callback for the link ID we want to handle? */
  if (port == sLinkID3)
  {
  /* yes. go get the frame. we know this call will succeed. */
     if ((SMPL_SUCCESS == SMPL_Receive(sLinkID3, simpliciti_data, &len)) && len)
     {
	      simpliciti_watch_decode_bike_callback();    
	      return 1;
     }
  }
  /* keep frame for later handling */
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
