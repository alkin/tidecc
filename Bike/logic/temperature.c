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
#include "temperature.h"
#include "ports.h"
#include "display.h"
#include "adc12.h"
#include "timer.h"

// logic


// *************************************************************************************************
// Prototypes section
u8 is_temp_measurement(void);
s16 convert_C_to_F(s16 value);
s16 convert_F_to_C(s16 value);


// *************************************************************************************************
// Defines section


// *************************************************************************************************
// Global Variable section
struct temp sTemp;

u16 b_temperature[60];
u8 b_temperature_count;


// *************************************************************************************************
// Extern section


// *************************************************************************************************
// @fn          reset_temp_measurement
// @brief       Reset temperature measurement module.
// @param       none
// @return      none
// *************************************************************************************************
void reset_temp_measurement(void)
{
	b_temperature_count			= 0;
	// Perform one temperature measurements with disabled filter
	temperature_measurement(FILTER_OFF);
}


// *************************************************************************************************
// @fn          temperature_measurement
// @brief       Init ADC12. Do single conversion of temperature sensor voltage. Turn off ADC12.
// @param       none
// @return      none
// *************************************************************************************************
void temperature_measurement(u8 filter)
{
	u16 adc_result;
	volatile s32 temperature;
	
	// Convert internal temperature diode voltage 
	adc_result = adc12_single_conversion(REFVSEL_0, ADC12SHT0_8, ADC12INCH_10);
	
	// Convert ADC value to "xx.x °C"
 	// Temperature in Celsius
    // ((A10/4096*1500mV) - 680mV)*(1/2.25mV) = (A10/4096*667) - 302
    // = (A10 - 1855) * (667 / 4096)
    temperature = (((s32)((s32)adc_result-1855))*667*10)/4096;
	
	// Add temperature offset
	temperature += sTemp.offset;	
	
	// Store measured temperature 
	if (filter == FILTER_ON)
	{
		// Change temperature in 0.1° steps towards measured value
		if (temperature > sTemp.degrees)		sTemp.degrees += 1;
		else if (temperature < sTemp.degrees)	sTemp.degrees -= 1;
	}
	else
	{
		// Override filter 
		sTemp.degrees = (s16)temperature;
	}
	
	push_temperature();
}


// *************************************************************************************************
// @fn          convert_C_to_F
// @brief       Convert °C to °F 
// @param       s16 value		Temperature in °C
// @return      s16 			Temperature in °F
// *************************************************************************************************
s16 convert_C_to_F(s16 value)
{
	s16 DegF;

	// Celsius in Fahrenheit = (( TCelsius × 9 ) / 5 ) + 32
    DegF = ((value*9*10)/5/10)+32*10;
    
	return (DegF);
}


// *************************************************************************************************
// @fn          convert_F_to_C
// @brief       Convert °F to °C 
// @param       s16 value		Temperature in 2.1 °F
// @return      s16 			Temperature in 2.1 °C
// *************************************************************************************************
s16 convert_F_to_C(s16 value)
{
	s16 DegC;

	// TCelsius =( TFahrenheit - 32 ) × 5 / 9
    DegC = (((value-320)*5))/9;
    
	return (DegC);
}


// *************************************************************************************************
// @fn          push_speed
// @brief       Resets speed value.
// @param       none
// @return      none
// *************************************************************************************************
void push_temperature(void)
{
	if(b_temperature_count == 60) return;
	
	b_temperature[b_temperature_count++] = sTemp.degrees;
}

// *************************************************************************************************
// @fn          get_speed_average
// @brief       Resets speed value.
// @param       none
// @return      none
// *************************************************************************************************
u16 get_temperature_average(void)
{
	u8 i;
	u32 sum=0, average;
	
	if(b_temperature_count == 0) return 0;
	
	for(i=0; i<b_temperature_count; i++)
	{
		sum += b_temperature[i];
	}
	average = sum/b_temperature_count;
	b_temperature_count = 0;
	return average; 
}

