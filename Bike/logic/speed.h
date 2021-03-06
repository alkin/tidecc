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

#ifndef SPEED_H_
#define SPEED_H_


// *************************************************************************************************
// Include section


// *************************************************************************************************
// Prototypes section
extern void reset_speed(void);
void push_speed(void);
u16 get_speed_average(void);
extern u16  convert_speed_to_km_h(u16 speed_ms);
extern u16  convert_speed_to_m_s(u16 speed_ms);
extern u16  convert_speed_to_mi_h(u16 speed_ms);
extern void do_speed_measurement(void);
extern void display_speed(u8 line, u8 update);

// *************************************************************************************************
// Defines section
#define SPEED_M_S				(0u)
#define SPEED_KM_H				(1u)
#define SPEED_MI_H				(2u)

typedef struct
{
    u16 value;
    u16 max;
} s_speed;


// *************************************************************************************************
// Global Variable section
extern volatile s_speed speed;
extern u16 b_speed[60];
extern u8 b_speed_count;

// *************************************************************************************************
// Extern section


#endif /*SPEED_H_*/
