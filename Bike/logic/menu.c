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
// Menu management functions.
// *************************************************************************************************


// *************************************************************************************************
// Include section

// system
#include "project.h"

// driver
#include "display.h"

// logic
#include "clock.h"
#include "battery.h"
#include "menu.h"
#include "altitude.h"
#include "rfbike.h"
#include "speed.h"
#include "distance.h"
#include "time.h"


// *************************************************************************************************
// Defines section
#define FUNCTION(function)  function


// *************************************************************************************************
// Global Variable section
const struct menu * ptrMenu_L1 = NULL;
const struct menu * ptrMenu_L2 = NULL;


// *************************************************************************************************
// Global Variable section

void display_nothing(u8 line, u8 update) {}

u8 update_time(void)
{
	return (display.flag.update_time);
}
u8 update_date(void)
{
	return (display.flag.update_date);
}
u8 update_temperature(void)
{
	return (display.flag.update_temperature);
}

// *************************************************************************************************
// User navigation ( [____] = default menu item after reset )
//
//	LINE1: 	[Time] -> Alarm -> Temperature -> Altitude -> Heart rate -> Speed -> Acceleration
//
//	LINE2: 	[Date] -> Stopwatch -> Battery  -> ACC -> PPT -> SYNC -> Calories/Distance
// *************************************************************************************************


const struct menu menu_L1_Speed =
{
	FUNCTION(dummy),			// direct function
	FUNCTION(dummy),			// sub menu function
	FUNCTION(display_speed),	// display function
	FUNCTION(update_time),		// new display data
	&menu_L1_Speed,
};

const struct menu menu_L2_Time =
{
	FUNCTION(dummy),			// direct function
	FUNCTION(dummy),			// sub menu function
	FUNCTION(display_time),		// display function
	FUNCTION(update_time),		// new display data
	&menu_L2_Distance,
};

const struct menu menu_L2_Distance =
{
	FUNCTION(dummy),			// direct function
	FUNCTION(dummy),				// sub menu function
	FUNCTION(display_distance),		// display function
	FUNCTION(update_time),			// new display data
	&menu_L2_Bike_link,
};

const struct menu menu_L2_Bike_link = {
   FUNCTION(dummy),             // direct function
   FUNCTION(dummy),             // sub menu function
   FUNCTION(display_link),      // display function
   FUNCTION(update_time),       // new display data
   &menu_L2_Time,
};


/*
// Line1 - Time
const struct menu menu_L1_Time =
{
	FUNCTION(sx_time),			// direct function
	FUNCTION(dummy),			// sub menu function
	FUNCTION(display_time),		// display function
	FUNCTION(update_time),		// new display data
	&menu_L1_Temperature,
};
// Line1 - Temperature

const struct menu menu_L1_Temperature =
{
	FUNCTION(dummy),					// direct function
	FUNCTION(dummy),					// sub menu function
	FUNCTION(display_temperature),		// display function
	FUNCTION(update_time),				// new display data
	&menu_L1_Altitude,
};
// Line1 - Altitude
const struct menu menu_L1_Altitude =
{
	FUNCTION(dummy),					// direct function
	FUNCTION(dummy),					// sub menu function
	FUNCTION(display_altitude),			// display function
	FUNCTION(update_time),				// new display data
#ifdef INCLUDE_BLUEROBIN_SUPPORT
	&menu_L1_Heartrate,
};

// Line2 - Date
const struct menu menu_L2_Date =
{
	FUNCTION(sx_date),			// direct function
	FUNCTION(dummy),			// sub menu function
	FUNCTION(display_date),		// display function
	FUNCTION(update_date),		// new display data
	&menu_L2_DataLog,
};
// Line2 - DataLog (data recording on/off)
const struct menu menu_L2_DataLog =
{
	FUNCTION(sx_datalog),			// direct function
	FUNCTION(dummy),				// sub menu function
	FUNCTION(display_datalog),		// display function
	FUNCTION(update_time),			// new display data
	&menu_L2_Sync,
};
// Line2 - SYNC (synchronization/data download via SimpliciTI)
const struct menu menu_L2_Sync =
{
	FUNCTION(sx_sync),				// direct function
	FUNCTION(dummy),				// sub menu function
	FUNCTION(display_sync),			// display function
	FUNCTION(update_time),			// new display data
	&menu_L2_RFBSL,
};
// Line2 - RFBSL
const struct menu menu_L2_RFBSL =
{
	FUNCTION(sx_rfbsl),				// direct function
	FUNCTION(dummy),				// sub menu function
	FUNCTION(display_rfbsl),		// display function
	FUNCTION(update_time),			// new display data
	&menu_L2_Date,
};
*/

void dummy(u8 line)
{
}

