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
// Acceleration measurement functions.
// *************************************************************************************************

// *************************************************************************************************
// Include section

// system
#include "project.h"
#include <string.h>

// driver
#include "display.h"
#include "vti_as.h"

// logic
#include "speed.h"
#include "simpliciti.h"
#include "user.h"


// *************************************************************************************************
// Global Variable section
u8 speed_flag;

// *************************************************************************************************
// Extern section

// Global flag for proper acceleration sensor operation

// *************************************************************************************************
// @fn          sx_alarm
// @brief       Sx button turns alarm on/off.
// @param       u8 line		LINE1
// @return      none
// *************************************************************************************************

void reset_speed(u8 mode) 
{
	// We have to create the variable speed
	
	// Set main 24H time to start value
	if(mode==SPEED_KM_H_)
	{
		speed_flag = SPEED_KM_H_;
	}
	else if(mode==SPEED_MI_H_)
	{
		speed_flag = SPEED_MI_H_;
	}
	else if(mode==SPEED_M_S_)
	{
		speed_flag = SPEED_M_S_;
	}
}

void sx_speed(u8 line)
{

}

// *************************************************************************************************
// @fn          display_datalog
// @brief       Display data logger information.
// @param       u8 line	LINE1, LINE2
//				u8 update	DISPLAY_LINE_UPDATE_FULL, DISPLAY_LINE_CLEAR
// @return      none
// *************************************************************************************************
void display_speed(u8 line, u8 update)
{
	
	// fAZER Partial update tambem!
	
	u8 string[8];
	memcpy(string, " VEL", 4);
	display_chars(LCD_SEG_L1_3_0, string, SEG_ON);
	
	if(speed_flag == SPEED_KM_H_)
	{
		display_symbol(LCD_UNIT_L1_K, SEG_ON);
		display_symbol(LCD_UNIT_L1_M, SEG_ON);
		display_symbol(LCD_UNIT_L1_PER_H, SEG_ON);
	}
	else if(speed_flag == SPEED_M_S_)
	{
		display_symbol(LCD_UNIT_L1_M, SEG_ON);
		display_symbol(LCD_UNIT_L1_PER_S, SEG_ON);
	}
	else if(speed_flag == SPEED_MI_H_)
	{
		display_symbol(LCD_UNIT_L1_M, SEG_ON);
		display_symbol(LCD_UNIT_L1_I, SEG_ON);
		display_symbol(LCD_UNIT_L1_PER_H, SEG_ON);
	}
}

