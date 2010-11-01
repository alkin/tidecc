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

// logic
#include "light.h"


// *************************************************************************************************
// Prototypes section


// *************************************************************************************************
// Defines section


// *************************************************************************************************
// Global Variable section


// *************************************************************************************************
// Extern section


// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert �C to �F 
// @param       s16 value		Temperature in �C
// @return      s16 			Temperature in �F
// *************************************************************************************************
void reset_light(void)
{
	//light.enable = false;
	
	BUTTONS_DIR |= BUTTON_DOWN_PIN;
	BUTTONS_OUT &= ~BUTTON_DOWN_PIN;
}


volatile u16 light_voltage;
// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert �C to �F 
// @param       s16 value		Temperature in �C
// @return      s16 			Temperature in �F
// *************************************************************************************************
void do_light_measurement(void)
{
	light_voltage = adc12_single_conversion(REFVSEL_1, ADC12SHT0_10, ADC12INCH_2);
	light_voltage = (light_voltage * 2 * 2) / 41; 

	if(light_voltage > 200)
	{
		BUTTONS_OUT |= BUTTON_BACKLIGHT_PIN;	
	} else
	{
		BUTTONS_OUT &= ~BUTTON_BACKLIGHT_PIN;
	}
	
	//light.value = light.value*0.8 + voltage*0.2;
}

// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert �C to �F 
// @param       s16 value		Temperature in �C
// @return      s16 			Temperature in �F
// *************************************************************************************************
void update_light(void)
{
/*
	if(ligth.value < xxx)
	{
		ligth.enable = true;
		BUTTONS_OUT |= BUTTON_DOWN_PIN;
	}
	else
	{
		ligth.enable = false;
		BUTTONS_OUT &= ~BUTTON_DOWN_PIN;
	}
*/
}
