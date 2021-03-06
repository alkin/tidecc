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

#ifndef LIGHT_H_
#define LIGHT_H_

// *************************************************************************************************
// Include section


// *************************************************************************************************
// Prototypes section
extern void reset_light(void);
extern void do_light_measurement(void);
extern void update_light(void);
extern void set_light(u8 light_unit, u8 status);
extern void toggle_light_front(void);
extern void toggle_light_back(void);


// *************************************************************************************************
// Defines section

#define	LIGHT_OFF			(0u)
#define	LIGHT_ON			(1u)

#define LIGHT_FRONT			(BUTTON_UP_PIN)
#define LIGHT_BACK			(BUTTON_DOWN_PIN)
#define LIGHT_BACKLIGHT 	(BUTTON_BACKLIGHT_PIN)
#define LIGHT_ALL			(BUTTON_UP_PIN|BUTTON_DOWN_PIN|BUTTON_BACKLIGHT_PIN)

#define	LIGHT_LEVEL			(120u)

typedef struct
{
    u16 value			: 9;
    u16 back_enable		: 1;
    u16 front_enable	: 1;
    u16 front_blink		: 6;
    u16 front_duty		: 7;
} s_light;

extern volatile s_light light;


// *************************************************************************************************
// Global Variable section


// *************************************************************************************************
// Extern section


#endif /*LIGHT_H_*/
