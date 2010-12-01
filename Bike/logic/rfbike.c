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
// SimpliciTI functions.
// *************************************************************************************************


// *************************************************************************************************
// Include section

// system
#include "project.h"

// driver
#include "display.h"
#include "vti_as.h"
#include "ports.h"
#include "timer.h"
#include "radio.h"
#include "flash.h"

// logic
#include "rfbike.h"
#include "simpliciti.h"
#include "clock.h"
#include "vti_ps.h"
#include "altitude.h"
#include "distance.h"
#include "speed.h"



// *************************************************************************************************
// Prototypes section
void simpliciti_get_data_callback(void);
void start_simpliciti_sync(void);


// *************************************************************************************************
// Defines section

// Each packet index requires 2 bytes, so we can have 9 packet indizes in 18 bytes usable payload
#define BM_SYNC_BURST_PACKETS_IN_DATA		(9u)


// *************************************************************************************************
// Global Variable section
struct RFsmpl sRFsmpl;

// flag contains status information, trigger to send data and trigger to exit SimpliciTI
unsigned char simpliciti_flag;

//flag for simpliciti control
unsigned char simpliciti_bike_flag;

unsigned char simpliciti_data_in_buffer;

// 4 data bytes to send 
unsigned char simpliciti_data[SIMPLICITI_MAX_PAYLOAD_LENGTH];

// 4 byte device address overrides SimpliciTI end device address set in "smpl_config.dat"
unsigned char simpliciti_ed_address[4];

// 1 = send one or more reply packets, 0 = no need to reply
//unsigned char simpliciti_reply;
unsigned char simpliciti_reply_count;

// 1 = send packets sequentially from burst_start to burst_end, 2 = send packets addressed by their index
u8 		burst_mode;

// Start and end index of packets to send out
u16		burst_start, burst_end;

// Array containing requested packets
u16		burst_packet[BM_SYNC_BURST_PACKETS_IN_DATA];

// Current packet index
u8		burst_packet_index;

// Byte-Pointer to flash memory
u8 		*flash_ptr; 


s_measurement measurement[12];
u8 measurement_count;

// *************************************************************************************************
// Extern section
extern void (*fptr_lcd_function_line1)(u8 line, u8 update);


// *************************************************************************************************
// @fn          reset_rf
// @brief       Reset SimpliciTI data. 
// @param       none
// @return      none
// *************************************************************************************************
void reset_rf(void)
{
	// No connection
	sRFsmpl.mode = SIMPLICITI_OFF;
	
	measurement_count = 0;
}

// *************************************************************************************************
// @fn          reset_rf
// @brief       Reset SimpliciTI data. 
// @param       none
// @return      none
// *************************************************************************************************
void rfbike_measurement(void)
{
	s_measurement temp;
	
	if(sTime.system_time%10 != 0) return;
	
	temp.system_time = sTime.system_time;
	temp.speed = get_speed_average();
	temp.distance = distance.value;
	temp.altitude = get_altitude_average();
	temp.temperature = get_temperature_average();
	temp.speed_max = speed.max;
	
	measurement[measurement_count++] = temp;
}


// *************************************************************************************************
// @fn          sx_sync
// @brief       Start SimpliciTI. Button DOWN connects/disconnects to access point.
// @param       u8 line		LINE2
// @return      none
// *************************************************************************************************
void sx_sync(u8 line)
{
	// Exit if battery voltage is too low for radio operation
	if (sys.flag.low_battery) return;
  	
  	// Start SimpliciTI in sync mode
	start_simpliciti_sync();
}


// *************************************************************************************************
// @fn          display_sync
// @brief       SimpliciTI display routine. 
// @param       u8 line			LINE2
//				u8 update		DISPLAY_LINE_UPDATE_FULL
// @return      none
// *************************************************************************************************
void display_sync(u8 line, u8 update)
{
	if (update == DISPLAY_LINE_UPDATE_FULL)	
	{
		display_chars(LCD_SEG_L2_5_0, (u8 *)"  SYNC", SEG_ON);
	}
}


// *************************************************************************************************
// @fn          is_rf
// @brief       Returns TRUE if SimpliciTI receiver is connected. 
// @param       none
// @return      u8
// *************************************************************************************************
u8 is_rf(void)
{
	return (sRFsmpl.mode != SIMPLICITI_OFF);
}

void sx_link(void)
{
    // Clear LINE1
   clear_line(LINE1);
   fptr_lcd_function_line1(LINE1, DISPLAY_LINE_CLEAR);

   // Turn on beeper icon to show activity
   display_symbol(LCD_ICON_BEEPER1, SEG_ON_BLINK_ON);
   display_symbol(LCD_ICON_BEEPER2, SEG_ON_BLINK_ON);
   display_symbol(LCD_ICON_BEEPER3, SEG_ON_BLINK_ON);

   // Prepare radio for RF communication
   open_radio();
 
   reset_simpliciti();
   
   // Set SimpliciTI mode
   sRFsmpl.mode = SIMPLICITI_SYNC;
   
   if (simpliciti_link_to())
   {
       bike_communication();
   }

   reset_simpliciti();
   
   // Set SimpliciTI state to OFF
   sRFsmpl.mode = SIMPLICITI_OFF;
   
   close_radio();

   // Clear last button events
   Timer0_A4_Delay(CONV_MS_TO_TICKS(BUTTONS_DEBOUNCE_TIME_OUT));
   BUTTONS_IFG = 0x00;
   button.all_flags = 0;

   // Clear icons
   display_symbol(LCD_ICON_BEEPER1, SEG_OFF_BLINK_OFF);
   display_symbol(LCD_ICON_BEEPER2, SEG_OFF_BLINK_OFF);
   display_symbol(LCD_ICON_BEEPER3, SEG_OFF_BLINK_OFF);

   // Force full display update
   display.flag.full_update = 1;
}

void display_link(u8 line, u8 update)
{
      display_chars(LCD_SEG_L2_5_0, (u8 *) "  LIN", SEG_ON);
}

void simpliciti_bike_decode_watch_callback(void)
{
    volatile u16 addr, mem;

   // Default behaviour is to send no reply packets
   simpliciti_reply_count = 0;

   switch (simpliciti_data[0])
   {
   	   u32 distance_aux;
	   case WATCH_CMD_NOP:
	      break;
	
	   case WATCH_CMD_GET_CONFIG:        // Send bike parameters to watch
	      simpliciti_data[0] = BIKE_CMD_CONFIG;
	      // Send single reply packet
	      simpliciti_reply_count = 1;
	      break;
	
	   case WATCH_CMD_SET_CONFIG:        // Set bike parameters
	      // Set parameters from the bike here
		  // config, distance, system_time	      
	      config.all_flags =(u16) ((simpliciti_data[2]<<8) + simpliciti_data[1])  ;
	      
	      distance_aux = (u16)((simpliciti_data[6] << 8) + (simpliciti_data[5]));
	      distance_aux = (distance.value << 16);
	      distance_aux = (u16)((simpliciti_data[4] << 8) + simpliciti_data[3]);
	      
	      // Ignore data if distance from bike is bigger than the value received from the watch
	      if(distance_aux > distance.value)
	      {
	         distance.value = distance_aux;
	      }
	     
	      // Ignore data if system_time from bike is bigger than the value received from the watch
	      if(sTime.system_time > ((simpliciti_data[8] << 8) +  simpliciti_data[7]))
	      {
	         sTime.system_time = ((simpliciti_data[8] << 8) +  simpliciti_data[7]);
	         sTime.hour = sTime.system_time/3600;
	         sTime.minute = (sTime.system_time%3600)/60;
	         sTime.second = (sTime.system_time%3600)%60;	      
	      }
	      simpliciti_data[0] = BIKE_CMD_CONFIG;
	      break;

	    case WATCH_CMD_GET_DATA:        // Set bike parameters
	      // Set parameters from the bike here
	       simpliciti_data[0] = BIKE_CMD_DATA;
	     //  simpliciti_reply_count
	    break;
	    
	    case WATCH_CMD_EXIT:       
	      //stop transmission and set sync variable to zero 
	      simpliciti_data[0]= BIKE_CMD_EXIT;
	      simpliciti_bike_flag = SIMPLICITI_BIKE_TRIGGER_STOP;
	      break;
   }
}

void simpliciti_bike_get_data_callback(void)
{  
     	u16 max_speed = 100;
   // simpliciti_data[0] contains data type and needs to be returned to AP
   switch (simpliciti_data[0])
   {
      case BIKE_CMD_DATA:	 
      	// Temperature, Altitude, time, distance, speed
     	
     	//simpliciti_data_in_buffer--;
     	
     	simpliciti_data[0] = BIKE_CMD_DATA;  
		simpliciti_data[1] = sTime.system_time & 0xFF;
		simpliciti_data[2] = (sTime.system_time >> 8) & 0xFF; 
		simpliciti_data[3] = speed.value & 0xFF;
		simpliciti_data[4] = (speed.value >> 8) & 0xFF; 
		simpliciti_data[5] = distance.value & 0xFF;
		simpliciti_data[6] = (distance.value >> 8) & 0xFF;
		simpliciti_data[7] = (distance.value >> 16) & 0xFF;
		simpliciti_data[8] = (distance.value >> 24) & 0xFF;
		simpliciti_data[9] = (sAlt.temperature_C >> 4) & 0xFF;
	    simpliciti_data[10] = ((sAlt.temperature_C << 4) & 0xF0) | ((sAlt.altitude >> 8) & 0x0F);
		simpliciti_data[11] = sAlt.altitude & 0xFF;
		simpliciti_data[12] = max_speed & 0xFF;
		simpliciti_data[13] = (max_speed >>8 ) & 0xFF;


		  // Assemble payload
	     // flash_ptr = (u8 *) (DATALOG_MEMORY_START);
	     // for (i = 1; i < BM_SYNC_DATA_LENGTH; i++)
	     // simpliciti_data[i] = *flash_ptr++;
	     
		/*simpliciti_data[0] = BIKE_CMD_DATA;
		simpliciti_data[1] = 1;
		simpliciti_data[2] = 2;
		simpliciti_data[3] = 3;
		simpliciti_data[4] = 4;
		simpliciti_data[5] = 5;
		simpliciti_data[6] = 6;
		simpliciti_data[7] = 7;
		simpliciti_data[8] = 8;
		simpliciti_data[9] = 9;
		simpliciti_data[10] = 10;
		simpliciti_data[11] = 11;
		simpliciti_data[12] = 10; // speed
		simpliciti_data[13] = 11;
		*/
      break;
    
      case BIKE_CMD_CONFIG:
         // send ack data to watch
         simpliciti_data[0] = BIKE_CMD_CONFIG;
      break;
      
      case BIKE_CMD_NOP:
      break;
      
      case BIKE_CMD_EXIT:
      // exit method
      break;
   }
}	  


void rfbike_sync(void)
{
	// connect -- send config 
	// sleep -- send data -- sleep
	
	if(simpliciti_bike_flag == SIMPLICITI_BIKE_CONNECT)
	{
	   // Clear LINE1
	   clear_line(LINE1);
	   fptr_lcd_function_line1(LINE1, DISPLAY_LINE_CLEAR);
	
	   // Turn on beeper icon to show activity
	   display_symbol(LCD_ICON_BEEPER1, SEG_ON_BLINK_ON);
	   display_symbol(LCD_ICON_BEEPER2, SEG_ON_BLINK_ON);
	   display_symbol(LCD_ICON_BEEPER3, SEG_ON_BLINK_ON);
	
	   // Prepare radio for RF communication
	   open_radio();
	 
	   reset_simpliciti();

       sRFsmpl.mode = SIMPLICITI_SYNC;  

	   if (simpliciti_link_to())
	   {
           display_chars(LCD_SEG_L2_5_0, (u8 *)"  PAIR", SEG_ON);
           simpliciti_bike_flag = SIMPLICITI_BIKE_TRIGGER_SEND_DATA;
	 
	   	   // Set SimpliciTI mode

	       bike_communication(); 
	       
	       sRFsmpl.mode = SIMPLICITI_IDLE;
	      
	   }
	   else
	   {
	      // couldn't pair start again
		  display_chars(LCD_SEG_L2_5_0, (u8 *)" ERROR", SEG_ON);
		  reset_simpliciti();
		  // Set SimpliciTI state to OFF
	      sRFsmpl.mode = SIMPLICITI_OFF;
	      //close_radio();
	   }
	  
	   // Clear icons
	   display_symbol(LCD_ICON_BEEPER1, SEG_OFF_BLINK_OFF);
	   display_symbol(LCD_ICON_BEEPER2, SEG_OFF_BLINK_OFF);
	   display_symbol(LCD_ICON_BEEPER3, SEG_OFF_BLINK_OFF);
	
	   // Force full display update
	   display.flag.full_update = 1;
	}
	else if(simpliciti_bike_flag==SIMPLICITI_BIKE_TRIGGER_SEND_DATA)
	{
	    bike_communication(); 
	}
}
