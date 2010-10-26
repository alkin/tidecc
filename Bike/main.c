// *************************************************************************************************
// Initialization and control of application.
// *************************************************************************************************

// *************************************************************************************************
// Include section

// system
#include "project.h"
#include <string.h>

// driver
#include "clock.h"
#include "display.h"
#include "vti_as.h"
#include "vti_ps.h"
#include "radio.h"
#include "buzzer.h"
#include "ports.h"
#include "timer.h"
#include "pmm.h"

// logic
#include "menu.h"
#include "date.h"
#include "battery.h"
#include "temperature.h"
#include "altitude.h"
#include "battery.h"
#include "acceleration.h"
#include "bluerobin.h"
#include "rfsimpliciti.h"
#include "simpliciti.h"
#include "datalog.h"

#include "speed.h"
#include "distance.h"
#include "time.h"

// *************************************************************************************************
// Prototypes section
void init_application(void);
void init_global_variables(void);
void wakeup_event(void);
void process_requests(void);
void display_update(void);
void idle_loop(void);
void configure_ports(void);
void read_calibration_values(void);
void do_measurements(void);


// *************************************************************************************************
// Defines section

// Number of calibration data bytes in INFOA memory
#define CALIBRATION_DATA_LENGTH		(13u)


// *************************************************************************************************
// Global Variable section

// Variable holding system internal flags
volatile s_system_flags sys;

// Variable holding flags set by logic modules 
volatile s_request_flags request;

// Variable holding message flags
volatile s_message_flags message;

// Variable holding bike flags
volatile s_bike_flags bike;

// Global radio frequency offset taken from calibration memory
// Compensates crystal deviation from 26MHz nominal value
u8 rf_frequoffset;

// Function pointers for LINE1 and LINE2 display function 
void (*fptr_lcd_function_line1)(u8 line, u8 update);
void (*fptr_lcd_function_line2)(u8 line, u8 update);


// *************************************************************************************************
// Extern section


// *************************************************************************************************
// @fn          main
// @brief       Main routine
// @param       none
// @return      none
// *************************************************************************************************
int main(void)
{
	// Init MCU 
	init_application();

	// Assign initial value to global variables
	init_global_variables();
	
	// Main control loop: wait in low power mode until some event needs to be processed
	while(1)
	{
		// When idle go to LPM3
    	idle_loop();
    	
    	// if RF not connected then try to connect (1s)
    	// else RF sync

		do_measurements();
		
		// if datalog then do_datalog();
		
		display_update();

/*
    	// Process wake-up events
    	if (button.all_flags || sys.all_flags) wakeup_event();
    	
    	// Process actions requested by logic modules
    	if (request.all_flags) process_requests();
    	
    	// Before going to LPM3, update display
    	if (display.all_flags) display_update();
*/ 

 	}	
}


// *************************************************************************************************
// @fn          init_application
// @brief       Initialize the microcontroller.
// @param       none
// @return      none
// *************************************************************************************************
void init_application(void)
{
	volatile unsigned char *ptr;
	  
	// ---------------------------------------------------------------------
	// Enable watchdog
	
	// Watchdog triggers after 16 seconds when not cleared
#ifdef USE_WATCHDOG		
	WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK;
#else
	WDTCTL = WDTPW + WDTHOLD;
#endif
	
	// ---------------------------------------------------------------------
	// Configure PMM
	SetVCore(3);

	// Set global high power request enable
	PMMCTL0_H  = 0xA5;
	PMMCTL0_L |= PMMHPMRE;
	PMMCTL0_H  = 0x00;	

	// ---------------------------------------------------------------------
	// Enable 32kHz ACLK	
	P5SEL |= 0x03;                            // Select XIN, XOUT on P5.0 and P5.1
	UCSCTL6 &= ~XT1OFF;        				  // XT1 On, Highest drive strength
	UCSCTL6 |= XCAP_3;                        // Internal load cap
	UCSCTL3 = SELA__XT1CLK;                   // Select XT1 as FLL reference
	UCSCTL4 = SELA__XT1CLK | SELS__DCOCLKDIV | SELM__DCOCLKDIV;     
	
	// ---------------------------------------------------------------------
	// Configure CPU clock for 12MHz
    _BIS_SR(SCG0);                  // Disable the FLL control loop
	UCSCTL0 = 0x0000;          // Set lowest possible DCOx, MODx
	UCSCTL1 = DCORSEL_5;       // Select suitable range
	UCSCTL2 = FLLD_1 + 0x16E;  // Set DCO Multiplier
    _BIC_SR(SCG0);                  // Enable the FLL control loop

    // Worst-case settling time for the DCO when the DCO range bits have been
    // changed is n x 32 x 32 x f_MCLK / f_FLL_reference. See UCS chapter in 5xx
    // UG for optimization.
    // 32 x 32 x 8 MHz / 32,768 Hz = 250000 = MCLK cycles for DCO to settle
    __delay_cycles(250000);
  
	// Loop until XT1 & DCO stabilizes, use do-while to insure that 
	// body is executed at least once
	do
	{
        UCSCTL7 &= ~(XT2OFFG + XT1LFOFFG + XT1HFOFFG + DCOFFG);
		SFRIFG1 &= ~OFIFG;                      // Clear fault flags
	} while ((SFRIFG1 & OFIFG));	


	// ---------------------------------------------------------------------
	// Configure port mapping
	
	// Disable all interrupts
	__disable_interrupt();
	// Get write-access to port mapping registers:
	PMAPPWD = 0x02D52;
	// Allow reconfiguration during runtime:
	PMAPCTL = PMAPRECFG;

	// P2.7 = TA0CCR1A or TA1CCR0A output (buzzer output)
	ptr  = &P2MAP0;
	*(ptr+7) = PM_TA1CCR0A;
	P2OUT &= ~BIT7;
	P2DIR |= BIT7;

	// P1.5 = SPI MISO input
	ptr  = &P1MAP0;
	*(ptr+5) = PM_UCA0SOMI;
	// P1.6 = SPI MOSI output
	*(ptr+6) = PM_UCA0SIMO;
	// P1.7 = SPI CLK output
	*(ptr+7) = PM_UCA0CLK;

	// Disable write-access to port mapping registers:
	PMAPPWD = 0;
	// Re-enable all interrupts
	__enable_interrupt();
	
	// ---------------------------------------------------------------------
	// Configure ports

	// ---------------------------------------------------------------------
	// Reset radio core
	radio_reset();
	radio_powerdown();	
	
	// ---------------------------------------------------------------------
	// Init acceleration sensor
	as_init();
	
	// ---------------------------------------------------------------------
	// Init LCD
	lcd_init();
  
	// ---------------------------------------------------------------------
	// Init buttons
	init_buttons();

	// ---------------------------------------------------------------------
	// Configure Timer0 for use by the clock and delay functions
	Timer0_Init();
	
	// ---------------------------------------------------------------------
	// Init pressure sensor
	ps_init();
}


// *************************************************************************************************
// @fn          init_global_variables
// @brief       Initialize global variables.
// @param       none
// @return      none
// *************************************************************************************************
void init_global_variables(void)
{
	// --------------------------------------------
	// Apply default settings

	// set menu pointers to default menu items
	ptrMenu_L1 = &menu_L1_Speed;
	ptrMenu_L2 = &menu_L2_Time;

	// Assign LINE1 and LINE2 display functions
	fptr_lcd_function_line1 = ptrMenu_L1->display_function;
	fptr_lcd_function_line2 = ptrMenu_L2->display_function;

	// Init system flags
	button.all_flags 	= 0;
	sys.all_flags 		= 0;
	request.all_flags 	= 0;
	display.all_flags 	= 0;
	message.all_flags	= 0;
	bike.all_flags 		= 0;
	
	// Force full display update when starting up
	display.flag.full_update = 1;

#ifndef ISM_US
	// Use metric units for display
	sys.flag.use_metric_units = 1;
#endif

	// Read calibration values from info memory
	read_calibration_values();
	
	// Set system time to default value
	reset_clock();
	
	// Set date to default value
	reset_date();
	
	// Set buzzer to default value
	reset_buzzer();
	
	// Reset altitude measurement
	reset_altitude_measurement();
	
	// Reset acceleration measurement
	reset_acceleration();

#ifdef INCLUDE_BLUEROBIN_SUPPORT	
	// Reset BlueRobin stack
	reset_bluerobin();
#endif

	// Reset SimpliciTI stack
	reset_rf();
	
	// Reset battery measurement
	reset_batt_measurement();
	
	// Reset data logger
	reset_datalog();
	
	// Reset speed
	reset_speed();
	
	// Reset distance
	//reset_distance();
	
	// Reset time
	//reset_time();
}


// *************************************************************************************************
// @fn          wakeup_event
// @brief       Process external / internal wakeup events.
// @param       none
// @return      none
// *************************************************************************************************
void wakeup_event(void)
{
/*	// Enable idle timeout
	sys.flag.idle_timeout_enabled = 1;

	// Process long button press event (while button is held)
	if (button.flag.star_long)
	{
		// Clear button event
		button.flag.star_long = 0;

		// Call sub menu function
		ptrMenu_L1->mx_function(LINE1);

		// Set display update flag
		display.flag.full_update = 1;
	}
	
	// Process single button press event (after button was released)
	else if (button.all_flags)
	{
		// STAR button event ---------------------------------------------------------------------
		// (Short) Advance to next menu item
		if(button.flag.star) 
		{
			// Clean up display before activating next menu item 
			fptr_lcd_function_line1(LINE1, DISPLAY_LINE_CLEAR);
			
			// Go to next menu entry
			ptrMenu_L1 = ptrMenu_L1->next;
				
			// Assign new display function
			fptr_lcd_function_line1 = ptrMenu_L1->display_function;

			// Set Line1 display update flag
			display.flag.line1_full_update = 1;

			// Clear button flag
			button.flag.star = 0;
		}
		// NUM button event ---------------------------------------------------------------------
		// (Short) Advance to next menu item
		else if(button.flag.num) 
		{
			// Clean up display before activating next menu item 
			fptr_lcd_function_line2(LINE2, DISPLAY_LINE_CLEAR);

			// Go to next menu entry
			ptrMenu_L2 = ptrMenu_L2->next;

			// Assign new display function
			fptr_lcd_function_line2 = ptrMenu_L2->display_function;

			// Set Line2 display update flag
			display.flag.line2_full_update = 1;

			// Clear button flag
			button.flag.num = 0;
		}	
		// UP button event ---------------------------------------------------------------------
		// Activate user function for Line1 menu item
		else if(button.flag.up) 	
		{
			// Call direct function
			ptrMenu_L1->sx_function(LINE1);

			// Set Line1 display update flag
			display.flag.line1_full_update = 1;
	
			// Clear button flag	
			button.flag.up = 0;
		}			
	
	// Process internal events
	if (sys.all_flags)
	{
		// Idle timeout ---------------------------------------------------------------------
		if (sys.flag.idle_timeout)
		{
			// Clear timeout flag	
			sys.flag.idle_timeout = 0;	
			
			// Clear display
			clear_display();	

			// Set display update flags
			display.flag.full_update = 1;
		}
	}
	
	// Disable idle timeout
	sys.flag.idle_timeout_enabled = 0;
	
	*/
}


// *************************************************************************************************
// @fn          process_requests
// @brief       Process requested actions outside ISR context.
// @param       none
// @return      none
// *************************************************************************************************
void process_requests(void)
{
	/*
	// Do temperature and pressure measurement
  	if (request.flag.altitude_measurement) do_altitude_measurement(FILTER_ON);
  	
  	// Add data to datalog buffer
  	if (request.flag.datalog) do_datalog();
	
	// Do voltage measurement
	if (request.flag.voltage_measurement) battery_measurement();
    	
	// Reset request flag
	request.all_flags = 0;
	*/
}


// *************************************************************************************************
// @fn          do_measurements
// @brief       Does all the measurements
// @param       none
// @return      none
// *************************************************************************************************
void do_measurements(void)
{
	// Do speed measurement
	do_speed_measurement();
	
	// Do distance measurement
	//do_distance_measurement(FILTER_ON);
	
	// Do altitude measurement
	do_altitude_measurement(FILTER_ON);
	
	// Reset Sensor
	// reset_sensor();
	
	// SE: Move to reset_sensor()
	sensor_counter=0;	
}


// *************************************************************************************************
// @fn          display_update
// @brief       Process display flags and call LCD update routines.
// @param       none
// @return      none
// *************************************************************************************************
void display_update(void)
{
	// ---------------------------------------------------------------------
	// Call Line1 display function
	if (display.flag.full_update ||	display.flag.line1_full_update)
	{
		clear_line(LINE1);	
		fptr_lcd_function_line1(LINE1, DISPLAY_LINE_UPDATE_FULL);
	}
	else if (ptrMenu_L1->display_update())
	{
		// Update line1 only when new data is available
		fptr_lcd_function_line1(LINE1, DISPLAY_LINE_UPDATE_PARTIAL);
	}

	// ---------------------------------------------------------------------
	// Call Line2 display function
	if (display.flag.full_update || display.flag.line2_full_update)
	{
		clear_line(LINE2);
		fptr_lcd_function_line2(LINE2, DISPLAY_LINE_UPDATE_FULL);
	}
	else if (ptrMenu_L2->display_update() && !message.all_flags)
	{
		// Update line2 only when new data is available
		fptr_lcd_function_line2(LINE2, DISPLAY_LINE_UPDATE_PARTIAL);
	}
	
	// ---------------------------------------------------------------------
	// Update Menu on Line2
	if(bike.flag.menu_time_over)
	{
			// Clean up display before activating next menu item 
			fptr_lcd_function_line2(LINE2, DISPLAY_LINE_CLEAR);

			// Go to next menu entry
			ptrMenu_L2 = ptrMenu_L2->next;

			// Assign new display function
			fptr_lcd_function_line2 = ptrMenu_L2->display_function;

			// Set Line2 display update flag
			display.flag.line2_full_update = 1;

			// Clear button flag
			bike.flag.menu_time_over = 0;
	}	
	
	// ---------------------------------------------------------------------
	// Clear display flag
	display.all_flags = 0;
}


// *************************************************************************************************
// @fn          to_lpm
// @brief       Go to LPM0/3. 
// @param       none
// @return      none
// *************************************************************************************************
void to_lpm(void)
{
	// Go to LPM3
	_BIS_SR(LPM3_bits + GIE); 
	__no_operation();
}


// *************************************************************************************************
// @fn          idle_loop
// @brief       Go to LPM. Service watchdog timer when waking up.
// @param       none
// @return      none
// *************************************************************************************************
void idle_loop(void)
{
	// To low power mode
	to_lpm();

#ifdef USE_WATCHDOG		
	// Service watchdog
	WDTCTL = WDTPW + WDTIS__512K + WDTSSEL__ACLK + WDTCNTCL;
#endif
}


// *************************************************************************************************
// @fn          read_calibration_values
// @brief       Read calibration values for temperature measurement, voltage measurement
//				and radio from INFO memory.
// @param       none
// @return      none
// *************************************************************************************************
void read_calibration_values(void)
{
	u8 cal_data[CALIBRATION_DATA_LENGTH];		// Temporary storage for constants
	u8 i;
	u8 * flash_mem;         					// Memory pointer
	
	// Read calibration data from Info D memory
	flash_mem = (u8 *)0x1800;
	for (i=0; i<CALIBRATION_DATA_LENGTH; i++)
	{
		cal_data[i] = *flash_mem++;
	}
	
	if (cal_data[0] == 0xFF) 
	{
		// If no values are available (i.e. INFO D memory has been erased by user), assign experimentally derived values	
		rf_frequoffset	= 4;
		sBatt.offset 	= -10;	
		simpliciti_ed_address[0] = 0x79;
		simpliciti_ed_address[1] = 0x56;
		simpliciti_ed_address[2] = 0x34;
		simpliciti_ed_address[3] = 0x12;
		sAlt.altitude_offset	 = 0;
	}
	else
	{
		// Assign calibration data to global variables
		rf_frequoffset	= cal_data[1];	
		// Range check for calibrated FREQEST value (-20 .. + 20 is ok, else use default value)
		if ((rf_frequoffset > 20) && (rf_frequoffset < (256-20)))
		{
			rf_frequoffset = 0;
		} 
		sBatt.offset 	= (s16)((cal_data[4] << 8) + cal_data[5]);
		simpliciti_ed_address[0] = cal_data[6];
		simpliciti_ed_address[1] = cal_data[7];
		simpliciti_ed_address[2] = cal_data[8];
		simpliciti_ed_address[3] = cal_data[9];
		// S/W version byte set during calibration?
		if (cal_data[12] != 0xFF)
		{
			sAlt.altitude_offset = (s16)((cal_data[10] << 8) + cal_data[11]);;
		}
		else
		{
			sAlt.altitude_offset = 0;	
		}
	}
}


