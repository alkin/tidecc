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
//
// SimpliciTI packet size (TX only mode)
// -------------------------------------
// 
// 		* packet rate			(100/3) packets/second = 33.3 packets/second				
//		* packet length			28 bytes 
//		* packet structure		4 bytes 	preamble 
//								4 bytes 	sync 
//								1 bytes 	length 
//								1 bytes 	address 
//								16 bytes 	data
//									 12 byte network data
//									 4  byte user data
//								2 bytes		crc 
//
// SimpliciTI frequency overview
// -----------------------------
//
// CC430_End_Device_433MHz.lib (433MHz ISM band)
//
//		* base frequency		433.92 MHz
//		* deviation				32 kHz
//		* channel spacing		25 kHz
//		* used channel number	0 (frequency agility/hopping disabled)
//		* data rate				76.8 kBaud
//		* output power			1.4 dBm
//		* duty					9,6% (TX only mode, 32 packets / second)
//
// CC430_End_Device_868MHz.lib (868MHz ISM band)
//
//		* base frequency		869.525 MHz
//		* deviation				32 kHz
//		* channel spacing		25 kHz
//		* used channel number	0 (frequency agility/hopping disabled)
//		* data rate				76.8 kBaud
//		* output power			1.1 dBm
//		* duty					9,6% (TX only mode, 32 packets / second)
//
// CC430_End_Device_915MHz.lib (915MHz ISM band)
//
//		* base frequency		902.000 MHz
//		* deviation				32 kHz
//		* channel spacing		200 kHz
//		* used channel number	20 (frequency agility/hopping disabled)
//		* data rate				76.8 kBaud
//		* output power			1.3 dBm
//		* duty					9.6% (TX only mode, 32 packets / second)
//
// *************************************************************************************************

// ---------------------------------------------------------------
// Generic defines and variables

// Entry point into SimpliciTI library
extern unsigned char simpliciti_link(void);

// 4 byte device address overrides device address set during compile time
extern unsigned char simpliciti_ed_address[4];

// Maximum data length
#define SIMPLICITI_MAX_PAYLOAD_LENGTH       	(32u)

// Data to send / receive 
extern unsigned char simpliciti_data[SIMPLICITI_MAX_PAYLOAD_LENGTH];

// Flag contains status information and triggers to send data or to exit SimpliciTI library
extern unsigned char last_send_index;

// Control is done from outside SimpliciTI library
extern unsigned char simpliciti_flag;

// Flag contains status information and triggers to send data or to exit SimpliciTI library
// Control is done from outside SimpliciTI library
extern unsigned char simpliciti_bike_flag;

#define SIMPLICITI_BIKE_IDLE        		    	(BIT0) 
#define SIMPLICITI_BIKE_CONNECT     		    	(BIT1) 	
#define SIMPLICITI_BIKE_STATUS_LINKING		    	(BIT2) 	
#define SIMPLICITI_BIKE_STATUS_LINKED		    	(BIT3)
#define SIMPLICITI_BIKE_STATUS_ERROR		        (BIT4)
#define SIMPLICITI_BIKE_TRIGGER_SEND_DATA 	        (BIT5)
#define SIMPLICITI_BIKE_TRIGGER_RECEIVED_DATA 	    (BIT6)
#define SIMPLICITI_BIKE_TRIGGER_STOP		        (BIT7)

// Radio frequency offset read from calibration memory
// Compensates crystal deviation from 26MHz nominal value
extern unsigned char rf_frequoffset;

// Macros
#define getFlag(val, flag)						((val&flag)==flag)
#define setFlag(val, flag)						(val|=flag)
#define clearFlag(val, flag)					(val&=(~flag))
#define toggleFlag(val, flag)					(val^=flag)


// ---------------------------------------------------------------
// SimpliciTI RX only

// Entry point into SimpliciTI library
extern void simpliciti_main_tx_only(void);

// Callback function to read data from acceleration sensor or buttons and trigger sending 
extern void simpliciti_get_ed_data_callback(void);

// ---------------------------------------------------------------
// SimpliciTI Sync

// Sync data length
#define BM_SYNC_DATA_LENGTH                     (19u)
#define BIKE_DATA_LENGTH                        (19u)

// Device data  (0)TYPE   (1) - (18) DATA 
#define SYNC_ED_TYPE_R2R                        (1u)
#define SYNC_ED_TYPE_MEMORY                     (2u)
#define SYNC_ED_TYPE_STATUS                     (3u)

// Host data    (0)CMD    (1) - (18) DATA 
#define SYNC_AP_CMD_NOP                         (1u)
#define SYNC_AP_CMD_GET_STATUS					(2u)
#define SYNC_AP_CMD_SET_WATCH                   (3u)
#define SYNC_AP_CMD_GET_MEMORY_BLOCKS_MODE_1   	(4u)
#define SYNC_AP_CMD_GET_MEMORY_BLOCKS_MODE_2   	(5u)
#define SYNC_AP_CMD_ERASE_MEMORY                (6u)
#define SYNC_AP_CMD_EXIT						(7u)

// Bike Data (0)CMD    (1) - (18) DATA 
#define BIKE_CMD_NOP                           (1u)
#define BIKE_CMD_CONFIG				           (2u)  // Flag to check config data
#define BIKE_CMD_DATA                          (3u)  // send data
#define BIKE_CMD_ERASE_MEMORY                  (4u)
#define BIKE_CMD_EXIT						   (5u)

// Watch (0)CMD   (1) - (18) DATA 
#define WATCH_CMD_NOP                          (6u)
#define WATCH_CMD_GET_CONFIG				   (7u)  // Flag to check config data
#define WATCH_CMD_SET_CONFIG                   (8u)  // Flag to send config data
#define WATCH_CMD_GET_DATA                     (9u)
#define WATCH_CMD_RESTART                      (10u)
#define WATCH_CMD_EXIT						   (11u)


// Entry point into SimpliciTI library
extern void simpliciti_main_sync(void);

// Callback function to decode access point command
extern void simpliciti_sync_decode_ap_cmd_callback(void);
// Callback function to read data from application and trigger sending
extern void simpliciti_sync_get_data_callback(unsigned int index);

extern void simpliciti_bike_get_data_callback(void);

// Callback function to read data from application and trigger sending
extern void simpliciti_bike_decode_watch_callback(void);

// Callback function to read data from application and trigger sending
extern void simpliciti_watch_decode_bike_callback(void);

// Send reply packets (>0), 0=no need to reply
extern unsigned char simpliciti_reply_count;

extern unsigned char simpliciti_listen_to(void);
extern unsigned char simpliciti_link_to(void);

extern void listen(void);
extern void simpliciti_bike_communication(void);

extern void reset_simpliciti(void);

extern void update_send_buffer_index (void);


