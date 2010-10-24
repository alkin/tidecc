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
// Speed functions.
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
u16 speed;

// *************************************************************************************************
// Extern section


// *************************************************************************************************
// @fn          reset_speed
// @brief       Resets speed to 0 m/s, km/h display format
// @param       none
// @return      none
// *************************************************************************************************
void reset_speed(void)
{
	speed = 0;
	speed_flag = SPEED_KM_H;
}

// *************************************************************************************************
// @fn          sx_speed
// @brief       Sx button does nothing.
// @param       u8 line		LINE1
// @return      none
// *************************************************************************************************
void sx_speed(u8 line)
{
	
}

// *************************************************************************************************
// @fn          convert_speed_to_km_h
// @brief       Converts the speed from m/s to km/h
// @param       u16 speed_ms	Speed in meters per second.
// @return      u16 			Speed in kilometers per hour.
// *************************************************************************************************
u16 convert_speed_to_km_h(u16 speed_ms)
{
	return (speed * 3.6);
}

// *************************************************************************************************
// @fn          convert_speed_to_mi_h
// @brief       Converts the speed from m/s to mi/h
// @param       u16 speed_ms	Speed in meters per second.
// @return      u16 			Speed in miles per hour.
// *************************************************************************************************
u16 convert_speed_to_mi_h(u16 speed_ms)
{
	//SE: Change conversion constant
	return (speed * 1);
}

// *************************************************************************************************
// @fn          do_speed_measurement
// @brief       Does a speed measurement.
// @param       none
// @return      none
// *************************************************************************************************
void do_speed_measurement(void)
{
	// speed = (sensor_counter * 2 * PI * bike_radius);	
}

// *************************************************************************************************
// @fn          set_speed_unit
// @brief       Changes the speed unit.
// @param       u8 unit		SPEED_KM_H, SPEED_MI_H, SPEED_M_S
// @return      none
// *************************************************************************************************
void set_speed_unit(u8 unit)
{
	//speed_flag ~= SPEED_KM_H | SPEED_MI_H | SPEED_M_S;
	speed_flag |= unit;	
}

// *************************************************************************************************
// @fn          display_speed
// @brief       Display speed information.
// @param       u8 line		LINE1, LINE2
//				u8 update	DISPLAY_LINE_UPDATE_FULL, DISPLAY_LINE_CLEAR
// @return      none
// *************************************************************************************************
void display_speed(u8 line, u8 update)
{
	u16 speed_km_h;
	u16 speed_mi_h;

	if (update == DISPLAY_LINE_UPDATE_PARTIAL) 
	{
		if(speed_flag == SPEED_KM_H)
		{
			speed_km_h = convert_speed_to_km_h(speed);
			display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_1_0), itoa(speed_km_h, 2, 0), SEG_ON);	
		}
		else if(speed_flag == SPEED_M_S)
		{
			display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_1_0), itoa(speed, 2, 0), SEG_ON);
		}
		else if(speed_flag == SPEED_MI_H)
		{
			speed_mi_h = convert_speed_to_mi_h(speed);
			display_chars(switch_seg(line, LCD_SEG_L1_1_0, LCD_SEG_L2_1_0), itoa(speed_mi_h, 2, 0), SEG_ON);
		}
	}
	else if (update == DISPLAY_LINE_UPDATE_FULL)			
	{
		display_speed(line, DISPLAY_LINE_UPDATE_PARTIAL);
		
		if(speed_flag == SPEED_KM_H)
		{
			display_symbol(LCD_UNIT_L1_K, SEG_ON);
			display_symbol(LCD_UNIT_L1_M, SEG_ON);
			display_symbol(LCD_UNIT_L1_PER_H, SEG_ON);
		}
		else if(speed_flag == SPEED_M_S)
		{
			display_symbol(LCD_UNIT_L1_M, SEG_ON);
			display_symbol(LCD_UNIT_L1_PER_S, SEG_ON);
		}
		else if(speed_flag == SPEED_MI_H)
		{
			display_symbol(LCD_UNIT_L1_M, SEG_ON);
			display_symbol(LCD_UNIT_L1_I, SEG_ON);
			display_symbol(LCD_UNIT_L1_PER_H, SEG_ON);
		}
	}
	else if (update == DISPLAY_LINE_CLEAR)
	{
			display_symbol(LCD_UNIT_L1_K, SEG_OFF);
			display_symbol(LCD_UNIT_L1_M, SEG_OFF);
			display_symbol(LCD_UNIT_L1_I, SEG_OFF);
			display_symbol(LCD_UNIT_L1_PER_H, SEG_OFF);
	}
}
