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
#include "distance.h"
// logic
#include "simpliciti.h"
#include "user.h"


// *************************************************************************************************
// Global Variable sectionstruct accel sAccel;

// Conversion values from data to mgrav taken from CMA3000-D0x datasheet (rev 0.4, table 4)

// *************************************************************************************************
// Extern section

// Global flag for proper acceleration sensor operation



// *************************************************************************************************
// @fn          sx_alarm
// @brief       Sx button turns alarm on/off.
// @param       u8 line		LINE1
// @return      none
// *************************************************************************************************
void sx_distance(u8 line)
{
	
}

// *************************************************************************************************
// @fn          display_datalog
// @brief       Display data logger information.
// @param       u8 line	LINE1, LINE2
//				u8 update	DISPLAY_LINE_UPDATE_FULL, DISPLAY_LINE_CLEAR
// @return      none
// *************************************************************************************************
void display_distance(u8 line, u8 update)
{
	
	u8 string[8];
	memcpy(string, "  430", 6);
	
	// fazer duas rotinas ou uma soh... tanto faz
	// comeca mostrando em metros
	// apos acabar os segmentos
	// mostrar em km
	
	if (update == DISPLAY_LINE_UPDATE_PARTIAL) 
	{
		display_chars(LCD_SEG_L2_5_0, string, SEG_ON);
		//mudar apenas a velocidade
	}
	
	else if (update == DISPLAY_LINE_UPDATE_FULL)	
	{
		//tudo
		display_chars(LCD_SEG_L2_5_0, string, SEG_ON);
		display_symbol(LCD_UNIT_L2_KM, SEG_ON);
	}
	else if (update == DISPLAY_LINE_CLEAR)
	{
		// Clean up Km or Mi icon
		display_chars(LCD_SEG_L2_5_0, string, SEG_OFF);
		display_symbol(LCD_UNIT_L2_KM, SEG_OFF);
	}
	
}
