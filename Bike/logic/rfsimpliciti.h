
#ifndef RFSIMPLICITI_H_
#define RFSIMPLICITI_H_

// *************************************************************************************************
// Include section


// *************************************************************************************************
// Prototypes section
extern void reset_rf(void);
extern void sx_rf(u8 line);
extern void sx_ppt(u8 line);
extern void sx_sync(u8 line);
extern void display_rf(u8 line, u8 update);
extern void display_ppt(u8 line, u8 update);
extern void display_sync(u8 line, u8 update);
extern void send_smpl_data(u16 data);
extern u8 is_rf(void);


// *************************************************************************************************
// Defines section

// SimpliciTI connection states
typedef enum
{
  SIMPLICITI_OFF = 0,       // Not connected
  SIMPLICITI_ACCELERATION,	// Transmitting acceleration data and button events
  SIMPLICITI_BUTTONS,		// Transmitting button events
  SIMPLICITI_SYNC			// Syncing
} simpliciti_mode_t;

// Stop SimpliciTI transmission after 60 minutes to save power
#define SIMPLICITI_TIMEOUT									(60*60u)

// Button flags for SimpliciTI data
#define SIMPLICITI_BUTTON_STAR			(0x10)
#define SIMPLICITI_BUTTON_NUM			(0x20)
#define SIMPLICITI_BUTTON_UP			(0x30)

// SimpliciTI mode flag
#define SIMPLICITI_MOUSE_EVENTS			(0x01)
#define SIMPLICITI_KEY_EVENTS			(0x02)


// *************************************************************************************************
// Global Variable section
struct RFsmpl
{
	// SIMPLICITI_OFF, SIMPLICITI_ACCELERATION, SIMPLICITI_BUTTONS
	simpliciti_mode_t 	mode;
	
	// Timeout until SimpliciTI transmission is automatically stopped
	u16					timeout;
};
extern struct RFsmpl sRFsmpl;

extern unsigned char simpliciti_flag;

// *************************************************************************************************
// Extern section

#endif /*RFSIMPLICITI_H_*/
