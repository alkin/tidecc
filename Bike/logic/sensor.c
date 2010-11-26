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
// Sensor functions.
// *************************************************************************************************


// *************************************************************************************************
// Include section

// system
#include "project.h"
#include <string.h>

// driver

// logic
#include "sensor.h"

// *************************************************************************************************
// Global Variable section
volatile s_sensor sensor;


// *************************************************************************************************
// Extern section


// *************************************************************************************************
// @fn          reset_sensor
// @brief       Resets the value of the sensor
// @param       none
// @return      none
// *************************************************************************************************
void reset_sensor(void)
{
	sensor.value = 0;	
}

// *************************************************************************************************
// @fn          sensor_tick
// @brief       Incresases the value of sensor ticks
// @param       none
// @return      none
// *************************************************************************************************
void sensor_tick(void)
{
	sensor.value++;
}

// *************************************************************************************************
// @fn          sensor_get_distance
// @brief       Returns the calculated distance based on the count of sensor ticks
// @param       none
// @return      u16 			Distance done in one second
// *************************************************************************************************
u16 sensor_get_distance(void)
{
	return (u16)(sensor.value * 3.1415 * config.bike_size / 10 / config.sensor_count);	
}
