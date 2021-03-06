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
// Light functions.
// *************************************************************************************************


// *************************************************************************************************
// Include section

// system
#include "project.h"

// driver
#include "adc12.h"
#include "ports.h"
#include "timer.h"

// logic
#include "light.h"

// *************************************************************************************************
// Prototypes section


// *************************************************************************************************
// Defines section
volatile s_light light;

// *************************************************************************************************
// Global Variable section


// *************************************************************************************************
// Extern section


// *************************************************************************************************
// @fn          reset_light
// @brief       Resets light values, Configures Port and Timer. 
// @param       none
// @return      none
// *************************************************************************************************
void reset_light(void)
{
	// Initialize light values
	light.value = 0;
	light.back_enable = FALSE;
	light.front_enable = FALSE;
	light.front_blink = 1;
	light.front_duty = 50;
	
	// Configure light pins
	BUTTONS_IE  &= ~(LIGHT_ALL);
	BUTTONS_REN &= ~(LIGHT_ALL);
	BUTTONS_DIR |=  (LIGHT_ALL);
	
	// Turn off all lights
	set_light(LIGHT_ALL, LIGHT_OFF);
	
	// Configure light timer callbacks
	fptr_Timer0_A1_function = toggle_light_front;
	fptr_Timer0_A2_function = toggle_light_back;	
}

// *************************************************************************************************
// @fn          do_light_measurement
// @brief       Measures light level 
// @param       none
// @return      none
// *************************************************************************************************
void do_light_measurement(void)
{
	u16 voltage;
	voltage = adc12_single_conversion(REFVSEL_1, ADC12SHT0_10, ADC12INCH_2);
 	voltage = (voltage * 2 * 2) / 41; 
	
	light.value = light.value*0.7 + voltage*0.3;
}

// *************************************************************************************************
// @fn          update_light
// @brief       Update light status 
// @param       none
// @return      none
// *************************************************************************************************
void update_light(void)
{
	if(!sys.flag.low_battery && light.value >= LIGHT_LEVEL)
	{
		// Config front light duty cicle and blink rate
		light.front_blink = 6;
		light.front_duty = 10;
		
		// Enable front light Timer
		light.front_enable = TRUE;
		Timer0_A1_Start();
		
		// Enable back light Timer
		light.back_enable = TRUE;
		Timer0_A2_Start(); 
	
		// Turn on lights
		set_light(LIGHT_ALL, LIGHT_ON);
	}
	else
	{
		// Disable front light Timer
		light.front_enable = FALSE;
		Timer0_A1_Stop();
		
		// Disable back light Timer
		light.back_enable = FALSE;
		Timer0_A2_Stop(); 
		
		// Turn off lights
		set_light(LIGHT_ALL, LIGHT_OFF);
	}
}


// *************************************************************************************************
// @fn          set_light
// @brief       Turns light ON or OFF 
// @param       u8 light_unit		Light to be changed
//				u8 status			LIGHT_ON, LIGHT_OFF
// @return      none
// *************************************************************************************************
void set_light(u8 light_unit, u8 status)
{
	if(status == LIGHT_ON)
	{
		BUTTONS_OUT &= ~(light_unit & (LIGHT_FRONT | LIGHT_BACK));
		//BUTTONS_OUT |=  (light_unit & (LIGHT_BACKLIGHT));
	}
	else
	{
		BUTTONS_OUT |=  (light_unit & (LIGHT_FRONT | LIGHT_BACK));
		BUTTONS_OUT &= ~(light_unit & (LIGHT_BACKLIGHT));		
	}
}

// *************************************************************************************************
// @fn          toggle_light_front
// @brief       Toggles front light status, Sets time for duty cycle. 
// @param       none
// @return      none
// *************************************************************************************************
void toggle_light_front(void)
{
	if(!sys.flag.low_battery && light.front_enable == FALSE)
	{
		set_light(LIGHT_FRONT, LIGHT_ON);
		
		TA0CCR1 = TA0R + CONV_MS_TO_TICKS(10 * light.front_duty / light.front_blink);

		light.front_enable = TRUE;
	} 
	else
	{
		set_light(LIGHT_FRONT, LIGHT_OFF);
		
		TA0CCR1 = TA0R + CONV_MS_TO_TICKS(10 * (100-light.front_duty) / light.front_blink);

		light.front_enable = FALSE;						
	}
}


// *************************************************************************************************
// @fn          toggle_light_back
// @brief       Toggles back light status, Sets time for duty cycle.
// @param       none
// @return      none
// *************************************************************************************************
void toggle_light_back(void)
{
	if(!sys.flag.low_battery && light.back_enable == FALSE)
	{
		set_light(LIGHT_BACK, LIGHT_ON);
		
		TA0CCR2 = TA0R + CONV_MS_TO_TICKS(10);

		light.back_enable = TRUE;
	} 
	else
	{
		set_light(LIGHT_BACK, LIGHT_OFF);
		
		TA0CCR2 = TA0R + CONV_MS_TO_TICKS(323);

		light.back_enable = FALSE;						
	}
}
