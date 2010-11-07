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
// Temperature measurement functions.
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
// @fn          convert_C_to_F
// @brief       Convert °C to °F 
// @param       s16 value		Temperature in °C
// @return      s16 			Temperature in °F
// *************************************************************************************************
void reset_light(void)
{
	light.enable = TRUE;
	light.value = 0;
	
	light.back_enable = 0;
	
	light.front_enable = 0;
	light.front_blink = 1;
	light.front_duty = 50;
	
	BUTTONS_IE  &= ~(BUTTON_UP_PIN|BUTTON_DOWN_PIN|BUTTON_BACKLIGHT_PIN);
	BUTTONS_REN &= ~(BUTTON_UP_PIN|BUTTON_DOWN_PIN|BUTTON_BACKLIGHT_PIN);
	BUTTONS_DIR |=  (BUTTON_UP_PIN|BUTTON_DOWN_PIN|BUTTON_BACKLIGHT_PIN);
	BUTTONS_OUT |=  (BUTTON_UP_PIN|BUTTON_DOWN_PIN);
	BUTTONS_OUT &= ~(BUTTON_BACKLIGHT_PIN);
	
	fptr_Timer0_A1_function = toggle_light_front;
	fptr_Timer0_A2_function = toggle_light_back;	
}

// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert °C to °F 
// @param       s16 value		Temperature in °C
// @return      s16 			Temperature in °F
// *************************************************************************************************
void do_light_measurement(void)
{
	u16 voltage;
	voltage = adc12_single_conversion(REFVSEL_1, ADC12SHT0_10, ADC12INCH_2);
 	voltage = (voltage * 2 * 2) / 41; 
	
	light.value = light.value*0.7 + voltage*0.3;
}

// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert °C to °F 
// @param       s16 value		Temperature in °C
// @return      s16 			Temperature in °F
// *************************************************************************************************
void update_light(void)
{
	if(light.value >= 10)
	{
		// Enable light
		light.front_enable = TRUE;
		light.front_blink = light.value-9;
		light.front_duty = 10;
		
		TA0CCR1 = TA0R + 10;
		TA0CCTL1 &= ~CCIFG; 
		TA0CCTL1 |= CCIE; 
		
		light.back_enable = TRUE;
		
		TA0CCR2 = TA0R + 10;
		TA0CCTL2 &= ~CCIFG; 
		TA0CCTL2 |= CCIE; 
	
		BUTTONS_OUT &= ~BUTTON_UP_PIN;
		BUTTONS_OUT |= BUTTON_BACKLIGHT_PIN;
	}
	else
	{
		light.front_enable = FALSE;
		light.back_enable = FALSE;
		
		// Clear timer interrupt    
		TA0CCTL1 &= ~CCIE; 
		
		// Clear timer interrupt    
		TA0CCTL2 &= ~CCIE; 
		
		BUTTONS_OUT |= BUTTON_UP_PIN;
		BUTTONS_OUT &= ~BUTTON_BACKLIGHT_PIN;
	}
}

// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert °C to °F 
// @param       s16 value		Temperature in °C
// @return      s16 			Temperature in °F
// *************************************************************************************************
void toggle_light_front(void)
{
	if(light.enable && light.front_enable == FALSE)
	{
		BUTTONS_OUT &= ~BUTTON_UP_PIN;

		TA0CCR1 = TA0R + CONV_MS_TO_TICKS(10 * light.front_duty / light.front_blink);

		light.front_enable = TRUE;
	} 
	else
	{
		BUTTONS_OUT |= BUTTON_UP_PIN;
		
		TA0CCR1 = TA0R + CONV_MS_TO_TICKS(10 * (100-light.front_duty) / light.front_blink);

		light.front_enable = FALSE;						
	}
}


// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert °C to °F 
// @param       s16 value		Temperature in °C
// @return      s16 			Temperature in °F
// *************************************************************************************************
void toggle_light_back(void)
{
	if(light.enable && light.back_enable == FALSE)
	{
		BUTTONS_OUT &= ~BUTTON_DOWN_PIN;
		
		TA0CCR2 = TA0R + CONV_MS_TO_TICKS(10);

		light.back_enable = TRUE;
	} 
	else
	{
		BUTTONS_OUT |= BUTTON_DOWN_PIN;
		
		TA0CCR2 = TA0R + CONV_MS_TO_TICKS(320);

		light.back_enable = FALSE;						
	}
}
