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
// Time functions.
// *************************************************************************************************


// *************************************************************************************************
// Include section

// system
#include "project.h"

// driver
#include "ports.h"
#include "display.h"
#include "timer.h"

// logic
#include "menu.h"
#include "clock.h"
#include "user.h"
#include "bluerobin.h"
#include "date.h"


// *************************************************************************************************
// Prototypes section
void reset_clock(void);
void clock_tick(void);

// *************************************************************************************************
// Defines section


// *************************************************************************************************
// Global Variable section
struct time sTime;


// *************************************************************************************************
// Extern section



// *************************************************************************************************
// @fn          reset_clock
// @brief       Resets clock time to 00:00:00, 24H time format.
// @param       none
// @return      none
// *************************************************************************************************
void reset_clock(void) 
{
	sTime.system_time = 0;

	sTime.hour   = 0; 
	sTime.minute = 0; 
	sTime.second = 0; 
}


// *************************************************************************************************
// @fn          clock_tick
// @brief       Add 1 second to system time and to display time
// @param       none
// @return      none
// *************************************************************************************************
void clock_tick(void) 
{
	// Increase global system time
	sTime.system_time++;

	// Add 1 second
	sTime.second++;
	
	// Add 1 minute
	if (sTime.second == 60)
	{
		sTime.second = 0;
		sTime.minute++;
	
		// Add 1 hour	
		if (sTime.minute == 60)
		{
			sTime.minute = 0;
			sTime.hour++;
		}
	}
}

// *************************************************************************************************
// @fn          display_time
// @brief       Clock display routine. Supports 24H and 12H time format. 
// @param       u8 line			LINE1
//				u8 update		DISPLAY_LINE_UPDATE_FULL, DISPLAY_LINE_UPDATE_PARTIAL
// @return      none
// *************************************************************************************************
void display_time(u8 line, u8 update)
{	
	// Partial update
 	if (update == DISPLAY_LINE_UPDATE_PARTIAL) 
	{
		if(sTime.hour > 0)
		{
			display_chars(LCD_SEG_L2_5_4, itoa(sTime.hour, 2, 1), SEG_ON);
			display_symbol(LCD_SEG_L2_COL1, SEG_ON);
		} 
		
		display_chars(LCD_SEG_L2_3_2, itoa(sTime.minute, 2, 0), SEG_ON); 
		display_chars(LCD_SEG_L2_1_0, itoa(sTime.second, 2, 0), SEG_ON);
	}
	else if (update == DISPLAY_LINE_UPDATE_FULL)			
	{
		display_time(line, DISPLAY_LINE_UPDATE_PARTIAL);

		display_symbol(LCD_SEG_L2_COL0, SEG_ON);
		display_symbol(LCD_ICON_STOPWATCH, SEG_ON);
	}
	else if (update == DISPLAY_LINE_CLEAR)
	{
		display_symbol(LCD_ICON_STOPWATCH, SEG_OFF);
		display_symbol(LCD_SEG_L2_COL0, SEG_OFF);
		display_symbol(LCD_SEG_L2_COL1, SEG_OFF);
	}
}
