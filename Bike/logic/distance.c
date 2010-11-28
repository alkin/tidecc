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
// Distance functions.
// *************************************************************************************************


// *************************************************************************************************
// Include section

// system
#include "project.h"
#include <string.h>

// driver
#include "display.h"

// logic
#include "distance.h"
#include "sensor.h"


// *************************************************************************************************
// Global Variable sectionstruct accel sAccel;
volatile s_distance distance;

// *************************************************************************************************
// Extern section

// *************************************************************************************************
// @fn          reset_distance
// @brief       Resets distance value
// @param       none
// @return      none
// *************************************************************************************************
void reset_distance(void)
{
	distance.value = 0;
}

// *************************************************************************************************
// @fn          convert_distance_to_km
// @brief       Converts distance into kilometers
// @param       u16 distance	Distance in meters with 1 decimal
// @return      u16 			Distance in kilometers with 2 decimals
// *************************************************************************************************
u32 convert_distance_to_km(u32 distance)
{
	return (distance / 100);
}

// *************************************************************************************************
// @fn          convert_distance_to_mi
// @brief       Converts distance into miles
// @param       u16 speed_ms	Distance in meters with 1 decimal
// @return      u16 			Distance in miles with 2 decimals
// *************************************************************************************************
u32 convert_distance_to_mi(u32 distance)
{
	return (distance * 0.62137 / 100 );
}

// *************************************************************************************************
// @fn          do_distance_measurement
// @brief       Increases the distance value by the distance travelled in the last second
// @param       none
// @return      none
// *************************************************************************************************
void do_distance_measurement(void)
{
	distance.value += sensor_get_distance();	
}

// *************************************************************************************************
// @fn          display_distance
// @brief       Display distance value
// @param       u8 line		LINE1, LINE2
//				u8 update	DISPLAY_LINE_UPDATE_FULL, DISPLAY_LINE_CLEAR
// @return      none
// *************************************************************************************************
void display_distance(u8 line, u8 update)
{
	u32 distance_km;
	u32 distance_mi;
	
	if (update == DISPLAY_LINE_UPDATE_PARTIAL) 
	{
		if(config.data.distance_unit == DISTANCE_KM)
		{
			distance_km = convert_distance_to_km(distance.value);
			display_chars(LCD_SEG_L2_4_0, itoa(distance_km, 5, 2), SEG_ON);	
		}
		else if(config.data.distance_unit == DISTANCE_MI)
		{
			distance_mi = convert_distance_to_mi(distance.value);
			display_chars(LCD_SEG_L2_4_0, itoa(distance_mi, 5, 2), SEG_ON);
		}
	}
	else if (update == DISPLAY_LINE_UPDATE_FULL)			
	{
		display_distance(line, DISPLAY_LINE_UPDATE_PARTIAL);
		display_symbol(LCD_SEG_L2_DP, SEG_ON);
		
		if(config.data.distance_unit == DISTANCE_KM)
		{
			display_symbol(LCD_UNIT_L2_KM, SEG_ON);
			display_symbol(LCD_UNIT_L2_MI, SEG_OFF);
		}
		else if(config.data.distance_unit == DISTANCE_MI)
		{
			display_symbol(LCD_UNIT_L2_KM, SEG_OFF);
			display_symbol(LCD_UNIT_L2_MI, SEG_ON);
		}
	}
	else if (update == DISPLAY_LINE_CLEAR)
	{
		display_symbol(LCD_UNIT_L2_KM, SEG_OFF);
		display_symbol(LCD_UNIT_L2_MI, SEG_OFF);
		
		display_symbol(LCD_SEG_L2_DP, SEG_OFF);
	}
}
