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
void mx_time(u8 line);
void sx_time(u8 line);

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
	// Set global system time to 0
	sTime.system_time = 0;
	
	// Set main 24H time to start value
	sTime.hour   = 0; 
	sTime.minute = 0; 
	sTime.second = 0; 
	
	// Display style of both lines is default (HH:MM)
	sTime.line1ViewStyle = DISPLAY_DEFAULT_VIEW;
	
	// Reset timeout detection
	sTime.last_activity 		  = 0;
}


// *************************************************************************************************
// @fn          clock_tick
// @brief       Add 1 second to system time and to display time
// @param       none
// @return      none
// *************************************************************************************************
void clock_tick(void) 
{
	// Use sTime.drawFlag to minimize display updates
	// sTime.drawFlag = 1: second
	// sTime.drawFlag = 2: minute, second
	// sTime.drawFlag = 3: hour, minute
	sTime.drawFlag = 1;

	// Increase global system time
	sTime.system_time++;

	// Add 1 second
	sTime.second++;
	
	// Add 1 minute
	if (sTime.second == 60)
	{
		sTime.second = 0;
		sTime.minute++;
		sTime.drawFlag++;
	
		// Add 1 hour	
		if (sTime.minute == 60)
		{
			sTime.minute = 0;
			sTime.hour++;
			sTime.drawFlag++;
		}
	}
}

// *************************************************************************************************
// @fn          sx_time
// @brief       Time user routine. Toggles view style between HH:MM and SS.
// @param       line		LINE1
// @return      none
// *************************************************************************************************
void sx_time(u8 line)
{
	// Toggle display view style
	if (sTime.line1ViewStyle == DISPLAY_DEFAULT_VIEW) 	sTime.line1ViewStyle = DISPLAY_ALTERNATIVE_VIEW;
	else 									 			sTime.line1ViewStyle = DISPLAY_DEFAULT_VIEW;
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
		if(sTime.drawFlag != 0) 
		{
			if (sTime.line1ViewStyle != DISPLAY_DEFAULT_VIEW)
			{
				switch(sTime.drawFlag) 
				{
					case 3: if (sys.flag.use_metric_units)
							{
								// Display 24H time "HH" 
								display_chars(switch_seg(line, LCD_SEG_L1_3_2, LCD_SEG_L2_3_2), itoa(sTime.hour, 2, 0), SEG_ON);
							}
					case 2: display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_1_0), itoa(sTime.minute, 2, 0), SEG_ON); 
				}
			}
			else
			{
				// Seconds are always updated
				display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_1_0), itoa(sTime.second, 2, 0), SEG_ON);
			}
		}	
	}
	else if (update == DISPLAY_LINE_UPDATE_FULL)			
	{
		// Full update
		if (sTime.line1ViewStyle != DISPLAY_DEFAULT_VIEW)
		{	
			// Display 24H/12H time
			if (sys.flag.use_metric_units)
			{
				// Display 24H time "HH" 
				display_chars(switch_seg(line, LCD_SEG_L1_3_2, LCD_SEG_L2_3_2), itoa(sTime.hour, 2, 0), SEG_ON);
			}				
			// Display minute
			display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_1_0), itoa(sTime.minute, 2, 0), SEG_ON); 
			display_symbol(switch_seg(line, LCD_SEG_L1_COL, LCD_SEG_L2_COL0), SEG_ON_BLINK_ON);
		}
		else
		{
			display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_3_2), itoa(sTime.minute, 2, 0), SEG_ON); 
			// Display seconds
			display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_1_0), itoa(sTime.second, 2, 0), SEG_ON);
			display_symbol(switch_seg(line, LCD_SEG_L1_DP1, LCD_SEG_L2_DP), SEG_ON);
		}
	}
	else if (update == DISPLAY_LINE_CLEAR)
	{
		display_symbol(switch_seg(line, LCD_SEG_L1_COL, LCD_SEG_L2_COL0), SEG_OFF_BLINK_OFF);
		// Change display style to default (HH:MM)
		sTime.line1ViewStyle = DISPLAY_DEFAULT_VIEW;
		// Clean up AM/PM icon
		display_symbol(LCD_SYMB_AM, SEG_OFF);
	}
}
