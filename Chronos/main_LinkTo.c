/*----------------------------------------------------------------------------
 *  Demo Application for SimpliciTI 
 * 
 *  L. Friedman 
 *  Texas Instruments, Inc.
 *---------------------------------------------------------------------------- */

/********************************************************************************************
  Copyright 2007-2009 Texas Instruments Incorporated. All rights reserved.

  IMPORTANT: Your use of this Software is limited to those specific rights granted under
  the terms of a software license agreement between the user who downloaded the software,
  his/her employer (which must be your employer) and Texas Instruments Incorporated (the
  "License"). You may not use this Software unless you agree to abide by the terms of the
  License. The License limits your use, and you acknowledge, that the Software may not be
  modified, copied or distributed unless embedded on a Texas Instruments microcontroller
  or used solely and exclusively in conjunction with a Texas Instruments radio frequency
  transceiver, which is integrated into your product. Other than for the foregoing purpose,
  you may not use, reproduce, copy, prepare derivative works of, modify, distribute,
  perform, display or sell this Software and/or its documentation for any purpose.

  YOU FURTHER ACKNOWLEDGE AND AGREE THAT THE SOFTWARE AND DOCUMENTATION ARE PROVIDED “AS IS”
  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY
  WARRANTY OF MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
  IN NO EVENT SHALL TEXAS INSTRUMENTS OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT,
  NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER LEGAL EQUITABLE
  THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES INCLUDING BUT NOT LIMITED TO ANY
  INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST
  DATA, COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY
  THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

  Should you have any questions regarding your right to use this Software,
  contact Texas Instruments Incorporated at www.TI.com.
**************************************************************************************************/

#include "bsp.h"
#include "mrfi.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"

#include  "cc430x613x.h" 
#include <string.h> 

//#include "app_remap_led.h"

static void link(void);
static void show(uint8_t mode);

void toggleLED(uint8_t);

static linkID_t sLinkID1 = 0;

uint8_t rf_frequoffset = 4;


/* application Rx frame handler. */
static uint8_t sRxCallback(linkID_t);

#define SPIN_ABOUT_A_SECOND  NWK_DELAY(1000)

void main (void)
{
  //show(1);  // listening - lis/
  //show(2);  // linking - lin 
  //show(3);  // connected - con
  //BSP_Init();
  BSP_InitBoard();
  
  /* If an on-the-fly device address is generated it must be done before the
   * call to SMPL_Init(). If the address is set here the ROM value will not 
   * be used. If SMPL_Init() runs before this IOCTL is used the IOCTL call 
   * will not take effect. One shot only. The IOCTL call below is conformal. 
   */
#ifdef I_WANT_TO_CHANGE_DEFAULT_ROM_DEVICE_ADDRESS_PSEUDO_CODE
  {
    addr_t lAddr;

    createRandomAddress(&lAddr);
    SMPL_Ioctl(IOCTL_OBJ_ADDR, IOCTL_ACT_SET, &lAddr);
  }
#endif /* I_WANT_TO_CHANGE_DEFAULT_ROM_DEVICE_ADDRESS_PSEUDO_CODE */

  /* This call will fail because the join will fail since there is no Access Point 
   * in this scenario. But we don't care -- just use the default link token later. 
   * We supply a callback pointer to handle the message returned by the peer. 
   */
  show(0);  // - hi
  SMPL_Init(sRxCallback);

  /* never coming back... */
  link();

  /* but in case we do... */
  while (1) ;
}

static void link()
{
  uint8_t msg[2];
  uint8_t pwr;
    
  show(2);  // linking - lin 
  
  pwr = IOCTL_LEVEL_2;
  SMPL_Ioctl(IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SETPWR, &pwr);
  
  while (SMPL_SUCCESS != SMPL_Link(&sLinkID1))
  {
    SPIN_ABOUT_A_SECOND;
  }

  show(3); // connected
  
  /* turn on RX. default is RX off. */
  SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);
 
  while (1)
  {
      /* put the sequence ID in the message */
    msg[0] = 4;
    SMPL_Send(sLinkID1, msg, sizeof(msg));
    SPIN_ABOUT_A_SECOND;
    
    msg[0] = 2;
    SMPL_Send(sLinkID1, msg, sizeof(msg));
    SPIN_ABOUT_A_SECOND;
    
    msg[0] = 1;
    SMPL_Send(sLinkID1, msg, sizeof(msg));
    SPIN_ABOUT_A_SECOND;
  }
}

/* handle received frames. */
static uint8_t sRxCallback(linkID_t port)
{
  uint8_t msg[2], len;

  /* is the callback for the link ID we want to handle? */
  if (port == sLinkID1)
  {
    /* yes. go get the frame. we know this call will succeed. */
     if ((SMPL_SUCCESS == SMPL_Receive(sLinkID1, msg, &len)) && len)
     {
         // show message
         show(*msg);
      return 1;
     }
  }
  /* keep frame for later handling. */
  return 0;
}

void show(uint8_t mode) 
{ 
  // 0 hi earth
  // 1 listening
  // 2 linking
  // 3 ok
  // 4 send
  
  
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
     else if(mode ==4) // MESSAGE
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
