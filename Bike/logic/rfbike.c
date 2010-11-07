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
#include <string.h>

#include "mrfi.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "simpliciti.h"

// driver

// logic
#include "rfbike.h"
#include "altitude.h"
#include "clock.h"
#include "distance.h"
#include "light.h"
#include "speed.h"
#include "temperature.h"

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
void rfbike_sync(void)
{
	/* ---- High Level Algorithm ----
	 * 
	 * Init Radio
	 * 
	 * Listen Connection
	 * 
	 * While( Receive == SUCCESS)
	 * 		Handle Packet
	 * 		if( PACKET == CIAO ) break;
	 * 
	 * Finish Radio
	 *  
	 */
	
	/* ---- Protocol ----
	 * 
	 *	<- Hello		(HANDSHAKE) 
	 *  -> Hallo
	 * 
	 *  <- Set Config   (Changes the config variable. Units, etc)
	 *  <- Config
	 *  -> ACK
	 * 
	 *  <- Get Data		(Asks for measurements data)
	 *  -> Data
	 *  <- ACK
	 * 
	 *  <- Bye			(End of Connection)
	 *  -> Ciao
	 */
	  
	// LISTEN
	
	u8 sLinkID1 = 0;
	u8 len;
	char recvBuffer[256];
	
	while (SMPL_Receive(sLinkID1, (uint8_t*)recvBuffer, &len) == SMPL_SUCCESS)
	{
 		if (len <= 0) break;
 		
 		if(strncmp(recvBuffer, "HELLO", 5) == 0)
 		{
 			SMPL_SendOpt(sLinkID1, (uint8_t*)"HALLO", 5, SMPL_TXOPTION_NONE);
 			continue;
 		}
 		
 		if(strncmp(recvBuffer, "BYE", 3) == 0)
 		{
 			SMPL_SendOpt(sLinkID1, (uint8_t*)"CIAO", 3, SMPL_TXOPTION_NONE);
 			break;
 		}
 		
 		if(strncmp(recvBuffer, "SETCONFIG", 9) == 0)
 		{
 			// Receive config
 			
 			// Set Config
 			
 			SMPL_SendOpt(sLinkID1, (uint8_t*)"ACK", 3, SMPL_TXOPTION_NONE);
 			continue;
 		}
 		
 		if(strncmp(recvBuffer, "GETDATA", 9) == 0)
 		{
 			// Send Data
 			
 			// Reads ACK
 			
 			continue;
 		}
 		
	}
}
