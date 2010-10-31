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

// logic
#include "session.h"
#include "speed.h"
#include "distance.h"


// *************************************************************************************************
// Global Variable sectionstruct accel sAccel;
volatile s_session session;

// *************************************************************************************************
// Extern section

// *************************************************************************************************
// @fn          reset_distance
// @brief       Resets speed to 0 m/s, km/h display format
// @param       none
// @return      none
// *************************************************************************************************
void reset_session(void)
{
//	session.id = config.session_id + 1;
	session.time_start = 0;
	session.time_end = 0;
	session.speed_max = 0;
	session.speed_avg = 0;
	session.distance = 0;
	session.energy = 0;
	session.temperature_avg = 0;
	session.altitude_start = 0;
	session.altitude_end = 0;
	session.energy = 0;
}


// *************************************************************************************************
// @fn          convert_distance_to_km
// @brief       Converts the speed from m/s to mi/h
// @param       u16 speed_ms	Speed in meters per second.
// @return      u16 			Speed in miles per hour.
// *************************************************************************************************
void update_session(void)
{
	//if(session.altitude_start == 0) session.altitude_start = ;
	//session.altitude_end = ;
	
	//if(session.time_start == 0) session.time_start = ;
	//session.time_end = ;
	
	//session.energy = ;
	
	//session.speed_avg = distance.value / session.time;
	if(speed.value > session.speed_max) session.speed_max = speed.value;
	
	//session.temperature_avg = ;
	
	session.distance = distance.value;
}
