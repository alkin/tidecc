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

// logic
#include "speed.h"
#include "sensor.h"

// *************************************************************************************************
// Global Variable section
volatile s_speed speed;

// *************************************************************************************************
// Extern section


// *************************************************************************************************
// @fn          reset_speed
// @brief       Resets speed value.
// @param       none
// @return      none
// *************************************************************************************************
void reset_speed(void)
{
	speed.value = 0;
}

// *************************************************************************************************
// @fn          convert_speed_to_m_s
// @brief       Converts speed into meters per second.
// @param       u16 value		Speed in meters per second with 1 decimal
// @return      u16 			Speed in meters per second
// *************************************************************************************************
u16 convert_speed_to_m_s(u16 speed)
{
	return (u16)(speed / 10);
}

// *************************************************************************************************
// @fn          convert_speed_to_km_h
// @brief       Converts speed into kilometers per hour.
// @param       u16 speed_ms	Speed in meters per second with 1 decimal
// @return      u16 			Speed in kilometers per hour
// *************************************************************************************************
u16 convert_speed_to_km_h(u16 speed)
{
	return (u16)(speed * 3.6 / 10);
}


// *************************************************************************************************
// @fn          convert_speed_to_mi_h
// @brief       Converts speed into miles per hour.
// @param       u16 speed   	Speed in meters per second with 1 decimal
// @return      u16 			Speed in miles per hour
// *************************************************************************************************
u16 convert_speed_to_mi_h(u16 speed)
{
	return (u16)(speed * 2.2369 / 10);
}

// *************************************************************************************************
// @fn          do_speed_measurement
// @brief       Updates speed value in meters per second with 1 decimal.
// @param       none
// @return      none
// *************************************************************************************************
void do_speed_measurement(void)
{
	//speed.value = sensor_get_distance();
	
	speed.value = sensor.value * 10;
	
	/*
	 	u16 voltage = adc12_single_conversion(REFVSEL_1, ADC12SHT0_10, ADC12INCH_11);
		voltage = (voltage * 2 * 2) / 41 * 10;	
		speed.value = voltage;
	*/
}

// *************************************************************************************************
// @fn          display_speed
// @brief       Display speed value.
// @param       u8 line		LINE1, LINE2
//				u8 update	DISPLAY_LINE_UPDATE_FULL, DISPLAY_LINE_CLEAR
// @return      none
// *************************************************************************************************
void display_speed(u8 line, u8 update)
{
	u16 speed_km_h;
	u16 speed_m_s;
	u16 speed_mi_h;

	if (update == DISPLAY_LINE_UPDATE_PARTIAL) 
	{
		if(config.speed_unit == SPEED_M_S)
		{
			speed_m_s = convert_speed_to_m_s(speed.value);
			display_chars(LCD_SEG_L1_2_0, itoa(speed_m_s, 3, 2), SEG_ON);
		}		
		else if(config.speed_unit == SPEED_KM_H)
		{
			speed_km_h = convert_speed_to_km_h(speed.value);
			display_chars(LCD_SEG_L1_2_0, itoa(speed_km_h, 3, 2), SEG_ON);	
		}
		else if(config.speed_unit == SPEED_MI_H)
		{
			speed_mi_h = convert_speed_to_mi_h(speed.value);
			display_chars(LCD_SEG_L1_2_0, itoa(speed_mi_h, 3, 2), SEG_ON);
		}
	}
	else if (update == DISPLAY_LINE_UPDATE_FULL)			
	{
		display_speed(line, DISPLAY_LINE_UPDATE_PARTIAL);
		
		if(config.speed_unit == SPEED_M_S)
		{
			display_symbol(LCD_UNIT_L1_M, SEG_ON);
			display_symbol(LCD_UNIT_L1_PER_S, SEG_ON);
			
			display_symbol(LCD_UNIT_L1_K, SEG_OFF);
			display_symbol(LCD_UNIT_L1_I, SEG_OFF);
			display_symbol(LCD_UNIT_L1_PER_H, SEG_OFF);
			
		}
		else if(config.speed_unit == SPEED_KM_H)
		{
			display_symbol(LCD_UNIT_L1_K, SEG_ON);
			display_symbol(LCD_UNIT_L1_M, SEG_ON);
			display_symbol(LCD_UNIT_L1_PER_H, SEG_ON);
			
			display_symbol(LCD_UNIT_L1_I, SEG_OFF);
			display_symbol(LCD_UNIT_L1_PER_S, SEG_OFF);
		}
		else if(config.speed_unit == SPEED_MI_H)
		{
			display_symbol(LCD_UNIT_L1_M, SEG_ON);
			display_symbol(LCD_UNIT_L1_I, SEG_ON);
			display_symbol(LCD_UNIT_L1_PER_H, SEG_ON);
			
			display_symbol(LCD_UNIT_L1_K, SEG_OFF);
			display_symbol(LCD_UNIT_L1_PER_S, SEG_OFF);
		}
	}
	else if (update == DISPLAY_LINE_CLEAR)
	{
			display_symbol(LCD_UNIT_L1_K, SEG_OFF);
			display_symbol(LCD_UNIT_L1_M, SEG_OFF);
			display_symbol(LCD_UNIT_L1_I, SEG_OFF);
			display_symbol(LCD_UNIT_L1_PER_H, SEG_OFF);
			display_symbol(LCD_UNIT_L1_PER_S, SEG_OFF);
	}
}
