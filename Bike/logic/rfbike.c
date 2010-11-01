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

#include "mrfi.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "simpliciti.h"

// driver
#include "temperature.h"
#include "display.h"

// logic
#include "rfbike.h"


// *************************************************************************************************
// Prototypes section


// *************************************************************************************************
// Defines section


// *************************************************************************************************
// Global Variable section


// *************************************************************************************************
// Extern section



// *************************************************************************************************
// @fn          idle_loop
// @brief       Go to LPM. Service watchdog timer when waking up.
// @param       none
// @return      none
// *************************************************************************************************
void rfbike_init2(void)
{
	// LISTEN
	u8 len;
	u8 sLinkID1;
	
	
	while (SMPL_Receive(sLinkID1, simpliciti_data, &len) == SMPL_SUCCESS)
	{
 		if (len <= 0) break;
 		
 		if(strncmp(simpliciti_data, "HELLO", 5))
 		{
 			SMPL_SendOpt(sLinkID1, "HALLO", 5, SMPL_TXOPTION_NONE);
 			continue;
 		}
 		
 		if(strncmp(simpliciti_data, "BYE", 3))
 		{
 			SMPL_SendOpt(sLinkID1, "CIAO", 3, SMPL_TXOPTION_NONE);
 			break;
 		}
 		
 		if(strncmp(simpliciti_data, "SETCONFIG", 9))
 		{
 			// Set Config
 			SMPL_SendOpt(sLinkID1, "ACK", 3, SMPL_TXOPTION_NONE);
 			continue;
 		}
 		
 		if(strncmp(simpliciti_data, "GETDATA", 9))
 		{
 			// Send Data
 			// SMPL_SendOpt(sLinkID1, "CIAO", 3, SMPL_TXOPTION_NONE);
 			
 			continue;
 		}
 		
	}	
	// <- Hello
	// -> Hallo
	
	// <- Set Config
	// <- Config
	// -> ACK
	
	// <- Get Measurements
	// -> Measure
	// <- ACK
	
	// <- Bye
	// -> Ciao	
}
