// *************************************************************************************************
//
//	Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/ 
//	 
//	 
//	  Redistribution and use in source and binary forms, with or without 
//	  modification, are permitted provided that the following conditions 
//	  are met:
//	
//	    Redistributions of source code must retain the above copyright 
//	    notice, this list of conditions and the following disclaimer.
//	 
//	    Redistributions in binary form must reproduce the above copyright
//	    notice, this list of conditions and the following disclaimer in the 
//	    documentation and/or other materials provided with the   
//	    distribution.
//	 
//	    Neither the name of Texas Instruments Incorporated nor the names of
//	    its contributors may be used to endorse or promote products derived
//	    from this software without specific prior written permission.
//	
//	  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
//	  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
//	  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//	  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
//	  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
//	  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
//	  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//	  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//	  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
//	  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
//	  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// *************************************************************************************************
// Timer service routines.
// *************************************************************************************************


// *************************************************************************************************
// Include section

// system
#include "project.h"

// driver
#include "timer.h"
#include "ports.h"
#include "buzzer.h"
#include "vti_ps.h"
#include "vti_as.h"

// logic
#include "clock.h"
#include "battery.h"
#include "altitude.h"
#include "display.h"
#include "rfsimpliciti.h"
#include "simpliciti.h"
#include "acceleration.h"
#include "bluerobin.h"
#include "temperature.h"
#include "datalog.h"


// *************************************************************************************************
// Prototypes section
void Timer0_Init(void);
void Timer0_Stop(void);
void Timer0_A1_Start(void);
void Timer0_A1_Stop(void);
void Timer0_A3_Start(u16 ticks);
void Timer0_A3_Stop(void);
void Timer0_A4_Delay(u16 ticks);
void (*fptr_Timer0_A1_function)(void);
void (*fptr_Timer0_A2_function)(void);
void (*fptr_Timer0_A3_function)(void);
 

// *************************************************************************************************
// Defines section


// *************************************************************************************************
// Global Variable section
struct timer sTimer;
u8 change_menu = 0;
// *************************************************************************************************
// Extern section
extern void BRRX_TimerTask_v(void);


// *************************************************************************************************
// @fn          Timer0_Init
// @brief       Set Timer0 to a period of 1 or 2 sec. IRQ TACCR0 is asserted when timer overflows.
// @param       none
// @return      none
// *************************************************************************************************
void Timer0_Init(void)
{
	// Set interrupt frequency to 1Hz
	TA0CCR0   = 32768 - 1;                

	// Enable timer interrupt    
	TA0CCTL0 |= CCIE;                     

	// Clear and start timer now   
	// Continuous mode: Count to 0xFFFF and restart from 0 again - 1sec timing will be generated by ISR
	TA0CTL   |= TASSEL0 + MC1 + TACLR;                       
}


// *************************************************************************************************
// @fn          Timer0_Start
// @brief       Start Timer0.
// @param       none
// @return      none
// *************************************************************************************************
void Timer0_Start(void)
{ 
	// Start Timer0 in continuous mode	 
	TA0CTL |= MC_2;          
}


// *************************************************************************************************
// @fn          Timer0_Stop
// @brief       Stop and reset Timer0.
// @param       none
// @return      none
// *************************************************************************************************
void Timer0_Stop(void)
{ 
	// Stop Timer0	 
	TA0CTL &= ~MC_2;

	// Set Timer0 count register to 0x0000
	TA0R = 0;                             
}

// *************************************************************************************************
// @fn          Timer0_A3_Start
// @brief       Trigger IRQ every "ticks" microseconds
// @param       ticks (1 tick = 1/32768 sec)
// @return      none
// *************************************************************************************************
void Timer0_A3_Start(u16 ticks)
{
	u16 value;
	
	// Store timer ticks in global variable
	sTimer.timer0_A3_ticks = ticks;
	
	// Delay based on current counter value
	value = TA0R + ticks;
	
	// Update CCR
	TA0CCR3 = value;   

	// Reset IRQ flag    
	TA0CCTL3 &= ~CCIFG; 
	          
	// Enable timer interrupt    
	TA0CCTL3 |= CCIE; 
}



// *************************************************************************************************
// @fn          Timer0_A3_Stop
// @brief       Stop Timer0_A3.
// @param       none
// @return      none
// *************************************************************************************************
void Timer0_A3_Stop(void)
{
	// Clear timer interrupt    
	TA0CCTL3 &= ~CCIE; 
}


// *************************************************************************************************
// @fn          Timer0_A4_Delay
// @brief       Wait for some microseconds
// @param       ticks (1 tick = 1/32768 sec)
// @return      none
// *************************************************************************************************
void Timer0_A4_Delay(u16 ticks)
{
	u16 value;
	
	// Exit immediately if Timer0 not running - otherwise we'll get stuck here
	if ((TA0CTL & (BIT4 | BIT5)) == 0) return;    

	// Disable timer interrupt    
	TA0CCTL4 &= ~CCIE; 	

	// Clear delay_over flag
	sys.flag.delay_over = 0;
	
	// Add delay to current timer value
	value = TA0R + ticks;
	
	// Update CCR
	TA0CCR4 = value;   

	// Reset IRQ flag    
	TA0CCTL4 &= ~CCIFG; 
	          
	// Enable timer interrupt    
	TA0CCTL4 |= CCIE; 
	
	// Wait for timer IRQ
	while (1)
	{
		_BIS_SR(LPM3_bits + GIE); 

#ifdef USE_WATCHDOG		
		// Service watchdog
		WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
#endif
		// Check stop condition
		if (sys.flag.delay_over) break;
	}
	
	// Exit from LPM3
	_BIC_SR(LPM3_bits); 
}




// *************************************************************************************************
// @fn          TIMER0_A0_ISR
// @brief       IRQ handler for TIMER0_A0 IRQ
//				Timer0_A0	1/1sec clock tick 			(serviced by function TIMER0_A0_ISR)
//				Timer0_A1	 							(serviced by function TIMER0_A1_5_ISR)
//				Timer0_A2	1/100 sec Stopwatch			(serviced by function TIMER0_A1_5_ISR)
//				Timer0_A3	Configurable periodic IRQ	(serviced by function TIMER0_A1_5_ISR)
//				Timer0_A4	One-time delay				(serviced by function TIMER0_A1_5_ISR)
// @param       none
// @return      none
// *************************************************************************************************
#pragma vector = TIMER0_A0_VECTOR
__interrupt void TIMER0_A0_ISR(void)
{
	
	// Disable IE 
	TA0CCTL0 &= ~CCIE;
	// Reset IRQ flag  
	TA0CCTL0 &= ~CCIFG;  
	// Add 1 sec to TACCR0 register (IRQ will be asserted at 0x7FFF and 0xFFFF = 1 sec intervals)
	TA0CCR0 += 32768;
	// Enable IE 
	TA0CCTL0 |= CCIE;
	
	// Add 1 second to global time
	clock_tick();
	
	// Set clock update flag
	display.flag.update_time = 1;
	
	// While BlueRobin searches freeze system state
	if (is_bluerobin_searching()) 
	{
		// Exit from LPM3 on RETI
		_BIC_SR_IRQ(LPM3_bits);     
		return;
	}
	
	// -------------------------------------------------------------------
	// Service active modules that require 1/s processing
	
    // Get BlueRobin data from API
	if (is_bluerobin()) get_bluerobin_data();
	
	// To change the menu automatically
	if( change_menu >= CHANGE_MENU_PERIOD )
	{
		display.flag.line2_change = 1;
		change_menu=0;
	}
	else
	{
		change_menu++;
	}
	
	// Exit from LPM3 on RETI
	_BIC_SR_IRQ(LPM3_bits);               
}


// *************************************************************************************************
// @fn          Timer0_A1_5_ISR
// @brief       IRQ handler for timer IRQ.
//				Timer0_A0	1/1sec clock tick (serviced by function TIMER0_A0_ISR)
//				Timer0_A1	BlueRobin timer 
//				Timer0_A2	
//				Timer0_A3	Configurable periodic IRQ (used by button_repeat and buzzer)
//				Timer0_A4	One-time delay
// @param       none
// @return      none
// *************************************************************************************************
#pragma vector = TIMER0_A1_VECTOR
__interrupt void TIMER0_A1_5_ISR(void)
{
	u16 value;
		
	switch (TA0IV)
	{
		// Timer0_A1	Light Timer
		case 0x02:	// Timer0_A1 handler
					TA0CCTL1 &= ~CCIE;
					// Reset IRQ flag  
					TA0CCTL1 &= ~CCIFG;  
					// Call function handler
					fptr_Timer0_A1_function();
					// Enable timer interrupt
					TA0CCTL1 |= CCIE;
					// Return without changing the Power Mode		
					return;	
		// Timer0_A2	Light timer
		case 0x04:	// Disable IE
					TA0CCTL2 &= ~CCIE;
					// Reset IRQ flag  
					TA0CCTL2 &= ~CCIFG;  
					// Call function handler
					fptr_Timer0_A2_function();
					// Enable timer interrupt
					TA0CCTL2 |= CCIE;
					// Return without changing the Power Mode		
					return;					
		// Timer0_A3	Configurable periodic IRQ (used by button_repeat and buzzer)			
		case 0x06:	// Disable IE 
					TA0CCTL3 &= ~CCIE;
					// Reset IRQ flag  
					TA0CCTL3 &= ~CCIFG;  
					// Store new value in CCR
					value = TA0R + sTimer.timer0_A3_ticks; //timer0_A3_ticks_g;
					// Load CCR register with next capture point
					TA0CCR3 = value;   
					// Enable timer interrupt    
					TA0CCTL3 |= CCIE; 	
					// Call function handler
					fptr_Timer0_A3_function();
					break;
		
		// Timer0_A4	One-time delay			
		case 0x08:	// Disable IE 
					TA0CCTL4 &= ~CCIE;
					// Reset IRQ flag  
					TA0CCTL4 &= ~CCIFG;  
					// Set delay over flag
					sys.flag.delay_over = 1;
					break;
	}
	
	// Exit from LPM3 on RETI
	_BIC_SR_IRQ(LPM3_bits);
}




