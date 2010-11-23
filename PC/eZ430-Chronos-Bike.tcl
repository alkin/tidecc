# *************************************************************************************************
#
#	Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/ 
#	 
#	 
#	  Redistribution and use in source and binary forms, with or without 
#	  modification, are permitted provided that the following conditions 
#	  are met:
#	
#	    Redistributions of source code must retain the above copyright 
#	    notice, this list of conditions and the following disclaimer.
#	 
#	    Redistributions in binary form must reproduce the above copyright
#	    notice, this list of conditions and the following disclaimer in the 
#	    documentation and/or other materials provided with the   
#	    distribution.
#	 
#	    Neither the name of Texas Instruments Incorporated nor the names of
#	    its contributors may be used to endorse or promote products derived
#	    from this software without specific prior written permission.
#	
#	  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
#	  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
#	  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#	  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
#	  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
#	  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
#	  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#	  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#	  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
#	  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
#	  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# *************************************************************************************************
# ez430-Chronos Control Center TCL/Tk script
# *************************************************************************************************
#
# Rev 1.2
# - Use of combobox
# - Bug fix windows 7
#
# Rev 1.1  
# - added ini file load/save dialog to load/save key settings to "Key Config" pane
# - added 12H / 24H format switch for "Sync" pane
# - added "RF BSL" pane and related functions 
# 
# Rev 1.0
# - initial version released to manufacturing
# *************************************************************************************************


# ----------------------------------------------------------------------------------------
# Load TCL packages and C library --------------------------------------------------------

package require Tk
package require Ttk

set exit_prog 0
catch { load [file [join [pwd]/eZ430_Chronos_CC.dll]] } result
if { [string first "couldn't" $result] != -1 } {
  tk_dialog .dialog1 "DLL not found. $arq" {Press OK to close application.} info 0 OK
  set exit_prog 1
}


# ----------------------------------------------------------------------------------------
# Global variables -----------------------------------------------------------------------

# Script revision number
set revision                1.1

# COM port variables
set com_port                "COM1:"
set com_available           0
set no_answer_from_dongle   0

# BlueRobin variables
set bluerobin_on            0
set heartrate               0
set speed                   0.0
set speed_limit_hi          25.0
set distance                0.0
set hr_sweep                0
set speed_sweep             0
set txid                    [expr 0xFFFF00 + round( rand() * 250)]
set msg                     0
set speed_is_mph            0
set speed_is_mph0           0

# SimpliciTi variables
set simpliciti_on           0
set simpliciti_mode         ""
set simpliciti_ap_started   0
set accel_x                 0
set accel_y                 0
set accel_z                 0
set accel_x_offset          0
set accel_y_offset          0
set accel_z_offset          0
set mouse_control           0
set move_x                  0
set move_y                  0
set wave_x                  { 0 50 600 50 }
set wave_y                  { 0 50 600 50 }
set wave_z                  { 0 50 600 50 }


# Key variables
set ini_file                "eZ430-Chronos-CC.ini"
set all_ini_files           { }
set button_event_text       "No button"
set button_event            0
set button_timeout          0
set event1                  { Arrow-Left Arrow-Right A B C D E F G H I J \
                              K L M N O P Q R S T U V W X Y Z F5 Space }
set event2                  { None Ctrl Alt Windows }
set pd_m1                   "Arrow-Left"
set pd_s1                   "Arrow-Right"
set pd_m2                   "F5"
set cb_m1_windows           0
set cb_m1_alt               0
set cb_m1_ctrl              0
set cb_m1_shift             0
set cb_s1_windows           0
set cb_s1_alt               0
set cb_s1_ctrl              0
set cb_s1_shift             0
set cb_m2_windows           0
set cb_m2_alt               0
set cb_m2_ctrl              0
set cb_m2_shift             0

# Sync global variables
set sync_time_hours_24      4
set sync_time_is_am         1
set sync_time_hours_12      4
set sync_time_minutes       30
set sync_time_seconds       0
set sync_date_year          2009
set sync_date_month         9
set sync_date_day           1
set sync_alarm_hours        6
set sync_alarm_minutes      30
set sync_altitude_24        500
set sync_altitude_12        1640
set sync_temperature_24     22
set sync_temperature_12     72
set sync_use_metric_units   1

set i -10
while {$i < 41} {
	lappend value_temperature_C $i
	incr i
	}
set i 14
while {$i < 105} {
	lappend value_temperature_F $i
	incr i
}
set i 0
while {$i < 60} {
	lappend values_60 $i
	incr i
}
set i 1
while {$i < 32} {
	lappend values_31 $i
	incr i
}
set i 1
while {$i < 31} {
	lappend values_30 $i
	incr i
}

set i 1
while {$i < 30} {
	lappend values_29 $i
	incr i
}

set i 1
while {$i < 29} {
	lappend values_28 $i
	incr i
}


set i 0
while {$i < 24} {
	lappend values_24 $i
	incr i
}
set i 1
while {$i < 13} {
	lappend values_12 $i
	incr i
}
set i 2010
while {$i < 2016} { 
	lappend values_years $i
	incr i
}
set i -100
while {$i < 2001} { 
	lappend values_altitude_meters $i
	incr i
}
set i -328
while {$i < 6563} { 
	lappend values_altitude_feet $i
	incr i
}

# WBSL global variables
set select_input_file       ""
set wbsl_progress           0
set wbsl_on                 0
set wbsl_ap_started         0
set fsize                   0
set fp                      0
set rData                   [list]
set rData_index             0
set low_index               0
set list_count              0
set wbsl_opcode             0
set maxPayload              0
set ram_updater_downloaded  0
set wirelessUpdateStarted   0
set wbsl_timer_enabled      0
set wbsl_timer_counter      0
set wbsl_timer_flag         0
set wbsl_timer_timeout      0

set varDate ""

set cbSpeed 1
set cbDistance 1
set cbAltitude 1
set cbTemperature 1


# Function required by WBSL
proc ceil x  {expr {ceil($x)} }


# ----------------------------------------------------------------------------------------
# Function prototypes --------------------------------------------------------------------
proc get_spl_data {} {}
proc update_br_data {} {}
proc check_rx_serial {} {}
proc inc_heartrate {} {}
proc inc_speed {} {}
proc move_cursor {} {}
proc get_wbsl_status {} {}
proc wbsl_set_timer { timeout } {}
proc wbsl_reset_timer {} {}

# ----

proc clearCanvas {can} {
	foreach id [$can find all] { $can delete $id }
}

proc update_report { } {
  global w
  global varDate
  global waveSpeed waveDistance waveAltitude waveTemperature
  global cbSpeed cbDistance cbAltitude cbTemperature

  if { $varDate == "" } return

  clearCanvas $w.note.report.frame2.canvas

  if { $cbSpeed == 1 } { $w.note.report.frame2.canvas create line $waveSpeed -width 2 -fill red -smooth 1 }
  if { $cbDistance == 1 } { $w.note.report.frame2.canvas create line $waveDistance -width 2 -fill black -smooth 1 }
  if { $cbAltitude == 1 } { $w.note.report.frame2.canvas create line $waveAltitude -width 2 -fill blue -smooth 1 }
  if { $cbTemperature == 1 } { $w.note.report.frame2.canvas create line $waveTemperature -width 2 -fill green -smooth 1 }

  set square {50 5 600 5 600 420 50 420 50 5}
  $w.note.report.frame2.canvas create line $square -width 1 -fill black 

  $w.note.report.frame2.canvas create text 45 15 -text "100 km/h" -fill red -font "Helvetica 7 bold" -justify left -anchor se  
  $w.note.report.frame2.canvas create text 45 25 -text "60 km" -fill black -font "Helvetica 7 bold" -justify left -anchor se
  $w.note.report.frame2.canvas create text 45 35 -text "2000 m" -fill blue -font "Helvetica 7 bold" -justify left -anchor se
  $w.note.report.frame2.canvas create text 45 45 -text "50 C" -fill green -font "Helvetica 7 bold" -justify left -anchor se

  $w.note.report.frame2.canvas create text 45 390 -text "0 km/h" -fill red -font "Helvetica 7 bold" -justify left -anchor se  
  $w.note.report.frame2.canvas create text 45 400 -text "0 km" -fill black -font "Helvetica 7 bold" -justify left -anchor se
  $w.note.report.frame2.canvas create text 45 410 -text "0 m" -fill blue -font "Helvetica 7 bold" -justify left -anchor se
  $w.note.report.frame2.canvas create text 45 420 -text "0 C" -fill green -font "Helvetica 7 bold" -justify left -anchor se

}

proc generate_report { } {
	# Analisa dados e preenche vars

	# Determina Scale e Offset

	# Gera Wave

}

proc load_report { } {
  global w
  global waveSpeed waveDistance waveAltitude waveTemperature
  global varDate varDistance varTime varAvgSpeed varMaxSpeed varTemperature varAltitude
  
  set waveSpeed {}
  set waveDistance {}
  set waveAltitude {}
  set waveTemperature {}

  # Try to open file with key definitions
  catch { set fhandle [open [$w.note.report.frame2.combo1 get] r] } res

  # Exit if file is missing
  if { [string first "couldn't open" $res] == 0 } { return }
 
  fconfigure $fhandle -buffering line

  gets $fhandle varDate
  gets $fhandle varDistance
  gets $fhandle varTime
  gets $fhandle varAvgSpeed
  gets $fhandle varMaxSpeed
  gets $fhandle varTemperature
  gets $fhandle varAltitude

  # Read file line by line and set global variables
  while { ![eof $fhandle] } {
    # Get next line
    gets $fhandle line

    set data [ split $line "," ]
    
    # Verify that extracted strings consist of ASCII characters
    if { [string is ascii [ lindex $data 0 ]] && [string is ascii [ lindex $data 1 ]] } {

        lappend waveSpeed [expr ([ lindex $data 0 ] + 50)] [expr (420 - [ lindex $data 1 ])] 
	  lappend waveDistance [expr ([ lindex $data 0 ] + 50)] [expr (420 - [ lindex $data 2 ])] 
	  lappend waveAltitude [expr ([ lindex $data 0 ] + 50)] [expr (420 - [ lindex $data 3 ])]
	  lappend waveTemperature [expr ([ lindex $data 0 ] + 50)] [expr (420 - [ lindex $data 4 ])]
    }
  }
  close $fhandle  
  update_report 
}




# ----------------------------------------------------------------------------------------
# Graphical user interface setup ---------------------------------------------------------

# Some custom styles for graphical elements
ttk::setTheme clam
ttk::style configure custom.TCheckbutton -font "Helvetica 9" -foreground "Red"
ttk::style configure custom.TLabelframe -font "Helvetica 12 bold"

ttk::style layout custom.cbRed { 
        custom.cbRed.border -children { 
                custom.cbRed.padding -sticky n -children { 
                        custom.cbRed.label -sticky n
                } 
        } 
} 

ttk::style layout custom.cbGreen { 
        custom.cbRed.border -children { 
                custom.cbRed.padding -sticky nswe -children { 
                        custom.cbRed.label -sticky nswe 
                } 
        } 
} 

ttk::style layout custom.cbBlue { 
        custom.cbRed.border -children { 
                custom.cbRed.padding -sticky nswe -children { 
                        custom.cbRed.label -sticky nswe 
                } 
        } 
} 

ttk::style layout custom.cbBlack { 
        custom.cbRed.border -children { 
                custom.cbRed.padding -sticky nswe -children { 
                        custom.cbRed.label -sticky nswe 
                } 
        } 
} 

ttk::style configure custom.cbRed -font "Helvetica 9" -foreground "Red"
ttk::style configure custom.cbGreen -font "Helvetica 9" -foreground "Green"
ttk::style configure custom.cbBlue -font "Helvetica 9" -foreground "Blue"
ttk::style configure custom.cbBlack -font "Helvetica 9" -foreground "Black"

# Set default font size for the app
switch $tcl_platform(platform) "unix" {
      font configure TkDefaultFont -family "tahoma" -size 8
   } "macintosh" {
    font configure TkDefaultFont -family "tahoma" -size 8
   } "windows" {
	font configure TkDefaultFont -family "tahoma" -size 8
   }



# Define basic window geometry
wm title . "Chronos Challenge - cBike Control Center v$revision"
wm geometry . 800x470
wm resizable . 0 0
wm iconname . "ttknote"
ttk::frame .f
pack .f -fill both -expand 1
set w .f

# Map keys to internal functions 
bind . <Key-q> { exitpgm }
bind . <Key-c> { calibrate_sensor }
bind . <Key-m> { allow_mouse_control }

# Make the notebook and set up Ctrl+Tab traversal
ttk::notebook $w.note
pack $w.note -fill both -expand 1 -padx 2 -pady 3
ttk::notebook::enableTraversal $w.note

# ----------------------------------------------------------------------------------------
# Report Charts pane -------------------------------------------------------------------
ttk::frame $w.note.report -style custom.TFrame
$w.note add $w.note.report -text "Report Charts" -underline 0 -padding 2 
grid columnconfigure $w.note.report {0 1} -weight 1 -uniform 1

ttk::frame $w.note.report.frame2 -style custom.TFrame
canvas $w.note.report.frame2.canvas -width 600 -height 420 -background "White" -borderwidth 0
ttk::label $w.note.report.frame2.lblReport -text "Report:" -justify left -font "Helvetica 10 bold"
ttk::combobox $w.note.report.frame2.combo1 -state readonly -values $all_ini_files -width 90
ttk::label $w.note.report.frame2.lblDisplay -text "Display:" -justify left -font "Helvetica 10 bold"
ttk::checkbutton $w.note.report.frame2.cb1 -text "Speed" -variable cbSpeed -style custom.cbRed -command {update_report}
ttk::checkbutton $w.note.report.frame2.cb2 -text "Distance" -variable cbDistance -command {update_report}
ttk::checkbutton $w.note.report.frame2.cb3 -text "Altitude" -variable cbAltitude -command {update_report}
ttk::checkbutton $w.note.report.frame2.cb4 -text "Temperature" -variable cbTemperature -command {update_report}
ttk::label $w.note.report.frame2.lblDate -text "Date:" -justify left -font "Helvetica 10 bold"
ttk::label $w.note.report.frame2.lblDate2 -textvariable varDate -justify left -font "Helvetica 9"
ttk::label $w.note.report.frame2.lblDistance -text "Distance:" -justify left -font "Helvetica 10 bold"
ttk::label $w.note.report.frame2.lblDistance2 -textvariable varDistance -justify left -font "Helvetica 9"
ttk::label $w.note.report.frame2.lblTime -text "Time:" -justify left -font "Helvetica 10 bold"
ttk::label $w.note.report.frame2.lblTime2 -textvariable varTime -justify left -font "Helvetica 9"
ttk::label $w.note.report.frame2.lblAvgSpeed -text "Average Speed:" -justify left -font "Helvetica 10 bold"
ttk::label $w.note.report.frame2.lblAvgSpeed2 -textvariable varAvgSpeed -justify left -font "Helvetica 9"
ttk::label $w.note.report.frame2.lblMaxSpeed -text "Max Speed:" -justify left -font "Helvetica 10 bold"
ttk::label $w.note.report.frame2.lblMaxSpeed2 -textvariable varMaxSpeed -justify left -font "Helvetica 9"
ttk::label $w.note.report.frame2.lblAvgTemperature -text "Average Temperature:" -justify left -font "Helvetica 10 bold"
ttk::label $w.note.report.frame2.lblAvgTemperature2 -textvariable varTemperature -justify left -font "Helvetica 9"
ttk::label $w.note.report.frame2.lblDiferenceAltitude -text "Diference Altitude:" -justify left -font "Helvetica 10 bold"
ttk::label $w.note.report.frame2.lblDiferenceAltitude2 -textvariable varAltitude -justify left -font "Helvetica 9"

grid $w.note.report.frame2 -row 1 -column 0 -pady 5 -padx 10 -sticky ew -columnspan 2 -rowspan 1
pack $w.note.report.frame2.canvas -side left -fill x
pack $w.note.report.frame2.lblReport -side top -fill x -padx 10
pack $w.note.report.frame2.combo1 -side top -fill x -padx 10 -pady 5
bind $w.note.report.frame2.combo1 <<ComboboxSelected>> { load_report }
pack $w.note.report.frame2.lblDisplay -side top -fill x -padx 10
pack $w.note.report.frame2.cb1 -side top -fill x -padx 20 
pack $w.note.report.frame2.cb2 -side top -fill x -padx 20 
pack $w.note.report.frame2.cb3 -side top -fill x -padx 20 
pack $w.note.report.frame2.cb4 -side top -fill x -padx 20

pack $w.note.report.frame2.lblDate -side top -fill x -padx 10
pack $w.note.report.frame2.lblDate2 -side top -fill x -padx 20
pack $w.note.report.frame2.lblDistance -side top -fill x -padx 10 
pack $w.note.report.frame2.lblDistance2 -side top -fill x -padx 20
pack $w.note.report.frame2.lblTime -side top -fill x -padx 10
pack $w.note.report.frame2.lblTime2 -side top -fill x -padx 20
pack $w.note.report.frame2.lblAvgSpeed -side top -fill x -padx 10
pack $w.note.report.frame2.lblAvgSpeed2 -side top -fill x -padx 20
pack $w.note.report.frame2.lblMaxSpeed -side top -fill x -padx 10
pack $w.note.report.frame2.lblMaxSpeed2 -side top -fill x -padx 20
pack $w.note.report.frame2.lblAvgTemperature -side top -fill x -padx 10
pack $w.note.report.frame2.lblAvgTemperature2 -side top -fill x -padx 20
pack $w.note.report.frame2.lblDiferenceAltitude -side top -fill x -padx 10
pack $w.note.report.frame2.lblDiferenceAltitude2 -side top -fill x -padx 20

set waveSpeed { }
set waveDistance { }
set waveAltitude { }
set waveTemperature { }
set waveZero { }
lappend waveZero 0 360
lappend waveZero 600 360

# ----------------------------------------------------------------------------------------
# Bike pane -------------------------------------------------------------------------
ttk::frame $w.note.br -style custom.TFrame 
$w.note add $w.note.br -text "Bike Configuration" -underline 0 -padding 2
grid columnconfigure $w.note.br {0 1} -weight 1 -uniform 1

# Control buttons
ttk::frame $w.note.br.frame0 -style custom.TFrame 
ttk::button $w.note.br.frame0.btnStartStop -text "Start transmitter" -command { start_bluerobin } -width 20
grid $w.note.br.frame0 -row 0 -column 0 -pady 10 -padx 10 -sticky ew
pack $w.note.br.frame0.btnStartStop -side left -fill x 

# Transmitter ID
ttk::frame $w.note.br.frame0a -style custom.TFrame 
ttk::label $w.note.br.frame0a.lblTXID -text "TX ID:  " -font "Helvetica 10 bold" -style custom.TLabel
ttk::entry $w.note.br.frame0a.e -textvariable txid -justify "right" -width 7 -state readonly -style custom.TLabel
grid $w.note.br.frame0a -row 0 -column 1 -pady 10 -padx 10 -sticky ew
pack $w.note.br.frame0a.lblTXID -side left -fill x 
pack $w.note.br.frame0a.e -side left -fill x 

# Heart rate sweep control
ttk::checkbutton $w.note.br.btn_sweephr -text " Sweep Heart Rate (bpm)" -variable hr_sweep -onvalue "1" -offvalue "0" -style custom.TCheckbutton 
grid $w.note.br.btn_sweephr -row 1 -column 0 -pady 0 -padx 2m -sticky ew 
scale $w.note.br.scale_hr -length 300 -showvalue 0 -orient h -from 40 -to 220 -variable heartrate -tickinterval 20 -borderwidth 0 -background "#DEDBD6" -highlightbackground "#DEDBD6" 
grid $w.note.br.scale_hr -row 2 -column 0 -pady 10 -padx 2m -sticky ew 

# Heart rate value
ttk::label $w.note.br.label_heartrate -textvariable heartrate -font "Helvetica 96 bold" -justify "right" -width 4  -anchor center -background "gray95"
grid $w.note.br.label_heartrate -row 3 -column 0 -pady 30 -padx 10 -sticky ew 

# Speed sweep control
ttk::frame $w.note.br.frame3 -style custom.TFrame 
ttk::checkbutton $w.note.br.frame3.btn -text " Sweep Speed" -variable speed_sweep -onvalue "1" -offvalue "0" -style custom.TCheckbutton 
ttk::radiobutton $w.note.br.frame3.btn1 -text "km/h" -variable speed_is_mph -value 0 -style custom.TCheckbutton -command { change_speed_unit }
ttk::radiobutton $w.note.br.frame3.btn2 -text "mph" -variable speed_is_mph -value 1 -style custom.TCheckbutton -command { change_speed_unit }
pack $w.note.br.frame3.btn -side left -fill x -pady 10 -padx 2m
pack $w.note.br.frame3.btn2 -side right -fill x -padx 5
pack $w.note.br.frame3.btn1 -side right -fill x -padx 5
grid $w.note.br.frame3 -row 1 -column 1 -pady 10 -padx 2m -sticky ew 
scale $w.note.br.scale_speed -length 300 -showvalue 0 -orient h -from 0 -to $speed_limit_hi -variable speed -tickinterval 5 -resolution 0.1 -borderwidth 0 -background "#DEDBD6" -highlightbackground "#DEDBD6" 
grid $w.note.br.scale_speed -row 2 -column 1 -pady 0 -padx 2m -sticky ew 

# Speed value
ttk::label $w.note.br.label_speed -textvariable speed -font "Helvetica 96 bold" -justify "right" -width 4  -anchor center -background "gray95"
grid $w.note.br.label_speed -row 3 -column 1 -pady 10 -padx 10 -sticky ew 

# Status line
labelframe $w.note.br.frame0b -borderwidth 1 -background "Yellow"
ttk::label $w.note.br.frame0b.lblStatus -text "Status:" -font "Helvetica 10 bold" -background "Yellow"
ttk::label $w.note.br.frame0b.lblStatusText -text "BlueRobin transmitter off." -font "Helvetica 10" -background "Yellow"
grid $w.note.br.frame0b -row 4 -column 0 -pady 20 -padx 10 -sticky ew -columnspan 2
pack $w.note.br.frame0b.lblStatus -side left -fill x 
pack $w.note.br.frame0b.lblStatusText -side left -fill x 

# ----------------------------------------------------------------------------------------
# About pane -----------------------------------------------------------------------------
ttk::frame $w.note.about -style custom.TFrame 
$w.note add $w.note.about -text "About" -underline 0 -padding 2
grid columnconfigure $w.note.about {0 1} -weight 1 -uniform 1

# SimpliciTI box
ttk::labelframe $w.note.about.s -borderwidth 1 
ttk::label $w.note.about.s.txt1 -font "Helvetica 12 bold" -justify "left" -width 4  -anchor center -style custom.TLabel -text "SimpliciTI\u2122"
ttk::label $w.note.about.s.txt2 -font "Helvetica 10" -width 80 -wraplength 550 -justify left -anchor n -style custom.TLabel \
-text "SimpliciTI\u2122 is a simple low-power RF network protocol aimed at small RF networks.\
\n\nSuch networks typically contain battery operated devices which require long battery life, low data rate and low duty cycle and have a limited number of nodes talking directly to each other or through an access point or range extenders. Access point and range extenders are not required but provide extra functionality such as store and forward messages.\
\n\nWith SimpliciTI\u2122 the MCU resource requirements are minimal which results in low system cost."
ttk::label $w.note.about.s.txt3 -font "Helvetica 10 bold" -wraplength 550 -justify left -anchor n -style custom.TLabel -text "Learn more about SimpliciTI\u2122 at http://www.ti.com/simpliciti"
grid $w.note.about.s -row 0 -column 0 -sticky new -pady 0 -columnspan 2
pack $w.note.about.s.txt1 -side top -fill x -pady 5 -padx 2m
pack $w.note.about.s.txt2 -side top -fill x -pady 0 -padx 2m
pack $w.note.about.s.txt3 -side top -fill x -pady 5 -padx 2m

# BlueRobin box
ttk::labelframe $w.note.about.b -borderwidth 1 
ttk::label $w.note.about.b.txt1 -font "Helvetica 12 bold italic" -foreground "Dark Blue" -justify "left" -width 4  -anchor center -text "BlueRobin\u2122" -style custom.TLabel
ttk::label $w.note.about.b.txt2 -font "Helvetica 10" -width 80 -wraplength 550 -justify left -anchor n -style custom.TLabel \
-text "The BlueRobin\u2122 protocol provides low data rate transmission for wireless body area sensor networks and team monitoring systems. Ultra-low power consumption, high reliability and low hardware costs are key elements of BlueRobin\u2122.\
\n\nBlueRobin\u2122 is successfully used in personal and multi-user heart rate monitoring systems, sports watches, chest straps, foot pods, cycle computers and other fitness equipment."
ttk::label $w.note.about.b.txt3 -font "Helvetica 10 bold" -wraplength 550 -justify left -anchor n -style custom.TLabel -text "Learn more about BlueRobin\u2122 at http://www.bm-innovations.com"
grid $w.note.about.b -row 1 -column 0 -sticky new -pady 5 -columnspan 2
pack $w.note.about.b.txt1 -side top -fill x -pady 5 -padx 2m
pack $w.note.about.b.txt2 -side top -fill x -pady 0 -padx 2m
pack $w.note.about.b.txt3 -side top -fill x -pady 5 -padx 2m


# ----------------------------------------------------------------------------------------
# Help pane ------------------------------------------------------------------------------
ttk::frame $w.note.help -style custom.TFrame
$w.note add $w.note.help -text "Help" -underline 0 -padding 2
grid columnconfigure $w.note.help {0 1} -weight 1 -uniform 1

# Help text
ttk::labelframe $w.note.help.frame -borderwidth 1 
ttk::label $w.note.help.frame.head -font "Helvetica 12 bold" -justify "left" -width 4  -anchor center -style custom.TLabel -text "Help"
ttk::label $w.note.help.frame.txt1 -font "Helvetica 10" -width 80 -wraplength 550 -justify left -anchor n -style custom.TLabel \
-text "If you cannot communicate with the RF Access Point, please check the following points in the Windows Device Manager:\n\
\n1) Do you have another instance of the GUI open? If so, please close it, since it may block the COM port.\
\n\n2) Does the RF Access Point appear under the friendly name \"TI CC1111 Low-Power RF to USB CDC Serial Port (COMxx)\". xx is the number of the COM port through which the RF Access Point can be accessed. If the RF Access Point is not listed, disconnect it from the USB port and reconnect it. If it still is not listed, or an error is shown, uninstall the RF Access Point (if possible) and reinstall the Windows driver manually.\
\n\n3) Have you applied the following settings to the RF Access Point?\n\
\n   - Bits per second: \t115200 \
\n   - Data bits: \t\t8 \
\n   - Parity: \t\tNone \
\n   - Stop bits: \t\t1 \
\n   - Flow control: \t\tNone \
\n \
\n \
\n "

grid $w.note.help.frame -row 0 -column 0 -sticky new -pady 0 -columnspan 2
pack $w.note.help.frame.head -side top -fill x -pady 5 -padx 2m
pack $w.note.help.frame.txt1 -side top -fill x -pady 0 -padx 2m



# ----------------------------------------------------------------------------------------
# Generic SimpliciTI functions -----------------------------------------------------------

# Start RF access point
proc start_simpliciti_ap { mode } {
  global w
  global simpliciti_on simpliciti_mode bluerobin_on com_available
  global simpliciti_ap_started
  global wbsl_on
  
  # No com port?  
  if { $com_available == 0} { return }
  
  # AP already on?
  if { $simpliciti_on == 1 } { return } 
  
  # Wireless Update on?  
  if { $wbsl_on == 1 } { return }
  
  # In BlueRobin mode? -> Stop BlueRobin transmission
  if { $bluerobin_on == 1 } { 
    stop_bluerobin
    after 500
  } 

  updateStatusSPL "Starting access point."
  after 500

  # Link with SimpliciTI transmitter
  catch { BM_SPL_Start } result
  if { $result == 0 } {
    updateStatusSPL "Failed to start access point."
    return
  }
  after 500
    
  # Set on flag after some waiting time  
  set simpliciti_on 1

  # Ignore dummy data from RF access point until it sends real values 
  set simpliciti_ap_started 0
  set simpliciti_mode $mode
  
  # Reconfigure control buttons
  $w.note.spl.frame0.btnStartStop configure -text "Stop Access Point" -command { stop_simpliciti_ap }
  $w.note.sync.f0.btn_start_ap configure -text "Stop Access Point" -command { stop_simpliciti_ap }
}


# Stop RF access point
proc stop_simpliciti_ap {} {
  global w
  global simpliciti_ap_started simpliciti_on bluerobin_on com_available
  global accel_x accel_y accel_z accel_x_offset accel_y_offset accel_z_offset

  # AP off?
  if { $simpliciti_on == 0 } { return } 

  # Clear on flag 
  set simpliciti_on 0
  
  # Send sync exit command (this will exit sync mode on watch side)
  catch { BM_SYNC_SendCommand 0x07 } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to stop access point."
    return
  }
  after 750
  
  # Stop SimpliciTI
  catch { BM_SPL_Stop } res

  # Link is now off
  updateStatusSPL "Access point is off."

  # Clear values
  set accel_x  0
  set accel_y  0
  set accel_z  0  
  set accel_x_offset 0
  set accel_y_offset 0
  set accel_z_offset 0  
  set simpliciti_ap_started 0
  update
  
  # Reconfig button
  $w.note.spl.frame0.btnStartStop configure -text "Start Access Point" -command { start_simpliciti_ap acc }
  $w.note.sync.f0.btn_start_ap configure -text "Start Access Point" -command { start_simpliciti_ap sync }
}


# ----------------------------------------------------------------------------------------
# SimpliciTI acc / ppt -------------------------------------------------------------------

# Zero-set x-y-z values
proc calibrate_sensor {} {
  global simpliciti_on
  global accel_x accel_y accel_z accel_x_offset accel_y_offset accel_z_offset
  
  # return if SPL is not active  
  if { $simpliciti_on == 0 } { return }
  
  # Wait until new frame has arrived
  after 100
  
  # Clear offset
  set accel_x_offset  0
  set accel_y_offset  0
  set accel_z_offset  0
  set accel_x         0
  set accel_y         0
  set accel_z         0

  # get new data
  get_spl_data
  
  # set new offset
  set accel_x_offset $accel_x
  set accel_y_offset $accel_y
  set accel_z_offset $accel_z
}


# Read received SimpliciTI data from RF access point
proc get_spl_data {} {
  global w
  global simpliciti_on simpliciti_ap_started simpliciti_mode
  global accel_x accel_y accel_z accel_x_offset accel_y_offset accel_z_offset
  global button_event_text button_event previous_button_event button_timeout
    
  # SimpliciTI off?  
  if { $simpliciti_on == 0 } { return }

  # Update status box  
  catch { BM_GetStatus } status

  # Check RF access point status byte  
  if { $status == 2 } {
  
    # Trying to link
    updateStatusSPL "Starting access point."
    return
  
  } elseif { $status == 3 } {
    
    # Read 32-bit SimpliciTI data from dongle
    # Data format is [Z-Y-X-KEY]
    catch { BM_SPL_GetData } data
    
    # Just started? Ignore first data
    if { $simpliciti_ap_started == 0} {

      if { $simpliciti_mode == "acc" } {
        updateStatusSPL "Access point started. Now start watch in acc or ppt mode." 
      } else {
        updateStatusSPL "Access point started. Now start watch in sync mode." 
      }
      set simpliciti_ap_started 1
      return

    } else {

      # if Byte0 is 0xFF, data has already been read from USB buffer, so do nothing
      if { ($data & 0xFF) == 0xFF } { return } 

    }
    
    # Extract watch button event from SimpliciTi data bits 7:0
    set button_event 0
    
    if { [expr ($data & 0xF0) ] != 0 } {
      
      set button_event  [expr ($data & 0xF0) ]
      
      if { $button_event == 0x10 } {
        set button_event_text "Button (*)"
      } elseif { $button_event == 0x20 } {
        set button_event_text "Button (#)"
      } elseif { $button_event == 0x30 } {
        set button_event_text "Button (Up)"
      }

      # Watch can send either key events (2) or mouse clicks (1) - distinguish mode here
      if { [expr ($data & 0x0F) ] == 0x01 } {
        switch $button_event {
          16    { catch { BM_SetMouseClick 1 } res 
                  updateStatusSPL "Left mouse click." }
          32    { catch { BM_SetMouseClick 3 } res
                  updateStatusSPL "Left mouse doubleclick." }
          48    { catch { BM_SetMouseClick 2 } res 
                  updateStatusSPL "Right mouse click." }
        }
      } elseif { [expr ($data & 0x0F) ] == 0x02 } {
        updateStatusSPL "$button_event_text was pressed."
        switch $button_event {
          16    { button_set M1 }
          32    { button_set M2 }
          48    { button_set S1 }
        }
      }
      update
      after 500
      # Dummy read to clear USB buffer
      catch { BM_SPL_GetData } data
      after 20
      catch { BM_SPL_GetData } data
      return
    }
    
    # Keep on drawing X-Y-Z values
    
    # Keep previous values for low pass filtering
    set prev_x  $accel_x
    set prev_y  $accel_y
    set prev_z  $accel_z
    
    # Extract acceleration values from upper data bits
    set accel_x [expr (($data >> 8)  & 0xFF)]
    set accel_y [expr (($data >> 16) & 0xFF)]
    set accel_z [expr (($data >> 24) & 0xFF)]
    
    # Convert raw data to signed integer
    
    # Get sign (1=minus, 0=plus)
    set sign_x  [expr ($accel_x&0x80) >> 7]
    set sign_y  [expr ($accel_y&0x80) >> 7]
    set sign_z  [expr ($accel_z&0x80) >> 7]
    
    # Convert negative 2's complement number to signed decimal
    if { $sign_x == 1 } { 
      set accel_x [ expr (((~$accel_x) & 0xFF ) + 1)*(-1) ]
    }    
    if { $sign_y == 1 } { 
      set accel_y [ expr (((~$accel_y) & 0xFF ) + 1)*(-1) ]
    }    
    if { $sign_z == 1 } { 
      set accel_z [ expr (((~$accel_z) & 0xFF ) + 1)*(-1) ]
    }    
    
    # Low pass filter values from acceleration sensor to avoid jitter
    set accel_x [expr ($accel_x*18*0.5) + $prev_x*0.5 - $accel_x_offset]
    set accel_y [expr ($accel_y*18*0.5) + $prev_y*0.5 - $accel_y_offset]
    set accel_z [expr ($accel_z*18*0.5) + $prev_z*0.5 - $accel_z_offset]
  
    # Display values in status line
    updateStatusSPL "Receiving data from acceleration sensor  X=[format %4.0f $accel_x]  Y=[format %4.0f $accel_y]  Z=[format %4.0f $accel_z]"
    
    # Use values to move mouse cursor 
    move_cursor

    # Update wave graphs
    add_wave_coords
  }
}


# Turn on/off mouse cursor control 
proc allow_mouse_control {} {
  global w mouse_control
 
  if { $mouse_control == 0 } {
    set mouse_control 1
    $w.note.spl.frame0.btnMouseContrl configure -text "Mouse Off (M)"
  } else {
    set mouse_control 0
    $w.note.spl.frame0.btnMouseContrl configure -text "Mouse On (M)"
  }
}


# Move mouse cursor through DLL functions
proc move_cursor {} {
  global simpliciti_on mouse_control
  global accel_x accel_y accel_z accel_x_offset accel_y_offset accel_z_offset

  # SimpliciTI off?  
  if { $simpliciti_on == 0 } { return }
  if { $mouse_control == 0 } { return }
  
  # Get current mouse cursor position
  set x [ BM_GetMouseX ]
  set y [ BM_GetMouseY ]
  
  # Set new mouse cursor position
  set delta_x [format %.0f [expr $accel_y/40]]
  set delta_y [format %.0f [expr $accel_x/40]]
  BM_SetMouseXY [expr $x + $delta_x] [expr $y + $delta_y]
}



# Grab all files in current directory and return list of files with right extension
proc get_files { ext } {

  set dir [pwd]
  set files { }

  foreach file0 [glob -nocomplain -directory $dir *$ext] {
    set file1 [file tail [file rootname $file0]]$ext
    lappend files "$file1"
  }

  return $files
}
set all_ini_files [get_files ".bike"]
$w.note.report.frame2.combo1 configure -values $all_ini_files


# Read variables from file 
proc load_ini_file { } {
  global w
  global ini_file 
  global pd_m1 pd_m2 pd_s1
  global cb_m1_windows cb_m1_alt cb_m1_ctrl cb_m1_shift
  global cb_s1_windows cb_s1_alt cb_s1_ctrl cb_s1_shift
  global cb_m2_windows cb_m2_alt cb_m2_ctrl cb_m2_shift
  global sync_use_metric_units
  
  # Try to open file with key definitions
  catch { set fhandle [open "$ini_file" r] } res
  
  # Exit if file is missing
  if { [string first "couldn't open" $res] == 0 } { return }
  
  fconfigure $fhandle -buffering line

  # Read file line by line and set global variables
  while { ![eof $fhandle] } {
    # Get next line
    gets $fhandle line
    # Split line
    set data [ split $line "=" ]
    # Verify that extracted strings consist of ASCII characters
    if { [string is ascii [ lindex $data 0 ]] && [string is ascii [ lindex $data 1 ]] } {
      # Set variable
      set [ lindex $data 0 ] [ lindex $data 1 ]
    }
  }
  
  close $fhandle  
}


# Save variables to file 
proc save_ini_file { } {
  global w
  global ini_file all_ini_files
  global pd_m1 pd_m2 pd_s1
  global cb_m1_windows cb_m1_alt cb_m1_ctrl cb_m1_shift
  global cb_s1_windows cb_s1_alt cb_s1_ctrl cb_s1_shift
  global cb_m2_windows cb_m2_alt cb_m2_ctrl cb_m2_shift
  global sync_use_metric_units
  
  # Open file save dialog first
  file_save_dialog $w
  
  # Delete existing ini file  
  catch { file delete "$ini_file" }
  
  # No file selected?
  if { $ini_file == "" } { return }
  
  # Break if directory is write only
  catch { set fhandle [open "$ini_file" a] } res
  if { [string first "permission denied" $res] == 0 } {
    return
  }
  
  fconfigure $fhandle -buffering line
  
  # Make a list of all key variables
  set keylist { pd_m1 pd_m2 pd_s1 \
                cb_m1_windows cb_m1_alt cb_m1_ctrl cb_m1_shift \
                cb_s1_windows cb_s1_alt cb_s1_ctrl cb_s1_shift \
                cb_m2_windows cb_m2_alt cb_m2_ctrl cb_m2_shift \
                sync_use_metric_units }
                
  # Walk through list and save variables to file
  foreach { el } $keylist {
    set val [expr $$el]
    puts $fhandle "$el=$val"
  }  

  close $fhandle  
  
  # Update ini file selection
  set all_ini_files [get_files ".ini"]
  $w.note.keys.fSel.combo1 configure -values $all_ini_files
  set ini_file [lindex $all_ini_files 0]
}


# Generic file save dialog
proc file_save_dialog { w } {
  global ini_file
  
  # Define default file type
  set types {
  	{"eZ430-Chronos configuration"		{.ini}	}
  	{"All files"		*}
  }

  # Use standard Windows file dialog 
  set selected_type "eZ430-Chronos configuration"
  set ini_file [tk_getSaveFile -filetypes $types -parent $w -initialfile "eZ430-Chronos.ini" -defaultextension .ini]
}


# ----------------------------------------------------------------------------------------
# SimpliciTI sync functions --------------------------------------------------------------


# Read watch settings
proc sync_read_watch {} {
  global w simpliciti_on
  global sync_time_is_am sync_time_hours_24 sync_time_hours_12 sync_time_minutes sync_time_seconds
  global sync_date_year sync_date_month sync_date_day
  global sync_alarm_hours sync_alarm_minutes
  global sync_use_metric_units
  global sync_temperature_24 sync_altitude_24 
  
  # SimpliciTI off?
  if { !$simpliciti_on } { return }
   
  # Dummy read to clean RF access point buffer
  catch { BM_SYNC_ReadBuffer } bin
  
  # Send command to watch
  catch { BM_SYNC_SendCommand 0x02 } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to send command."
    return
  }
  updateStatusSYNC "Requesting watch data."

  # Wait for buffer to be filled with data - or timeout
  set repeat 10
  while { $repeat > 0 } {
    after 100
    set status [ BM_SYNC_GetBufferStatus ]
    if { $status == 1 } {
      set repeat 0
      catch { BM_SYNC_ReadBuffer } bin
      binary scan $bin H* hex
      
      # Decode received data      
      # Received hours is always 24H format
      set sync_time_hours_24      [expr [expr 0x[string range $hex 2 3]] & 0x7F]
      set sync_use_metric_units   [expr ([expr 0x[string range $hex 2 3]] >> 7) & 0x01 ]
      set sync_time_minutes       [expr 0x[string range $hex 4 5]]
      set sync_time_seconds       [expr 0x[string range $hex 6 7]]
      set sync_date_year          [expr 0x[string range $hex 8 11]]
      set sync_date_month         [expr 0x[string range $hex 12 13]]
      set sync_date_day           [expr 0x[string range $hex 14 15]]
      set sync_alarm_hours        [expr 0x[string range $hex 16 17]]
      set sync_alarm_minutes      [expr 0x[string range $hex 18 19]]
      set sync_temperature_24     [format "%2.0f" [expr [expr [format "%2.1f" 0x[string range $hex 20 23]]]/10]]
      set sync_altitude_24        [expr 0x[string range $hex 24 27]]

      # Calculate new 24H / 12H time
      update_time_24
      update_time_12
      
      # Reconfigure display
      if { $sync_use_metric_units == 1 } {
        switch_to_metric_units
      } else {
        switch_to_imperial_units
      }
      
      updateStatusSYNC "Received watch data."
    } else {
        set repeat [expr $repeat-1]
    }
  }
}


# Write watch settings
proc sync_write_watch {} {
  global w simpliciti_on
  global sync_use_metric_units sync_time_is_am sync_time_hours_24 sync_time_hours_12 sync_time_minutes sync_time_seconds
  global sync_date_year sync_date_month sync_date_day
  global sync_alarm_hours sync_alarm_minutes
  global sync_temperature_24 sync_temperature_12 sync_altitude_24 sync_altitude_12
  
  	# Modify if it is not a digit
	if {[string is digit -strict $sync_date_year]==0} { 
		updateStatusSYNC "Invalid value for year."
		return
	}	
	if {[string is digit -strict $sync_date_month]==0} { 
		updateStatusSYNC "Invalid value for month."
		return
	}	
	if {[string is digit -strict $sync_date_day	]==0} {
		updateStatusSYNC "Invalid value for day."
		return
	}		
    if {[string is digit -strict $sync_time_hours_12]==0} {
		updateStatusSYNC "Invalid value for hours."
		return
	}	
	if {[string is digit -strict $sync_time_hours_24]==0} {
		updateStatusSYNC "Invalid value for hours."
		return
	}	
	if {[string is digit -strict $sync_time_minutes	]==0} {
		updateStatusSYNC "Invalid value for minutes."
		return
	}	
	if {[string is digit -strict $sync_time_seconds	]==0} {
		updateStatusSYNC "Invalid value for seconds."
		return
	}
	if {([string is digit -strict $sync_temperature_24]==0) && ($sync_use_metric_units == 1)} {
		updateStatusSYNC "Invalid value for temperature."
		return
	}	
	if {([string is digit -strict $sync_temperature_12]==0) && ($sync_use_metric_units == 0)} {
		updateStatusSYNC "Invalid value for temperature."
		return
	}
	if {([string is digit -strict $sync_altitude_24]==0) && ($sync_use_metric_units == 1)} {
		updateStatusSYNC "Invalid value for altitude."
		return
	}    
	if {([string is digit -strict $sync_altitude_12]==0) && ($sync_use_metric_units == 0)} {
		updateStatusSYNC "Invalid value for altitude."
		return
	}    
  
  # AP not enabled?
  if { !$simpliciti_on } { 
		updateStatusSYNC "Access Point is off."
		return 
	}

  # Assemble command string
  set cmd "BM_SYNC_SendCommand 0x03 "
  append cmd [format "0x%02X " [expr $sync_time_hours_24 | (($sync_use_metric_units<<7)&0x80)]]
  append cmd [format "0x%02X " $sync_time_minutes]
  append cmd [format "0x%02X " $sync_time_seconds]
  append cmd [format "0x%02X " [expr $sync_date_year >> 8]]
  append cmd [format "0x%02X " [expr $sync_date_year & 0xFF]]
  append cmd [format "0x%02X " $sync_date_month] 
  append cmd [format "0x%02X " $sync_date_day] 
  append cmd [format "0x%02X " $sync_alarm_hours] 
  append cmd [format "0x%02X " $sync_alarm_minutes] 
  set t1 [format "%.0f" [expr $sync_temperature_24*10]]
  append cmd [format "0x%02X " [expr $t1 >> 8]]
  append cmd [format "0x%02X " [expr $t1 & 0xFF]] 
  append cmd [format "0x%02X " [expr $sync_altitude_24 >> 8]]
  append cmd [format "0x%02X " [expr $sync_altitude_24 & 0xFF]] 
  
  catch { eval $cmd } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to send data."
    return
  }
  updateStatusSYNC "Sent data to watch."
}


# Read system time and date
proc sync_get_time_and_date {} {
  global w 
  global sync_use_metric_units sync_time_is_am sync_time_hours_24 sync_time_minutes sync_time_seconds
  global sync_date_year sync_date_month sync_date_day

  # Get date  
  set sync_date_year    [expr [format "%04.0f" [expr [clock format [clock seconds] -format "%Y"]]]]
  set sync_date_month   [expr [clock format [clock seconds] -format "%m"]]
  if { [string first 0 $sync_date_month] == 0 } {
    set sync_date_month [expr [string replace $sync_date_month 0 0]]
  }
  set sync_date_day    [expr [clock format [clock seconds] -format "%e"]]
  
  # Get hours in 24H time format
  set sync_time_hours_24 [clock format [clock seconds] -format "%H"]
  if { [string first 0 $sync_time_hours_24] == 0 } {
    set sync_time_hours_24 [string replace $sync_time_hours_24 0 0]
  }
  
  # Calculate hours in 12H time format
  update_time_24
  
  # Get minutes and seconds
  set sync_time_minutes  [clock format [clock seconds] -format "%M"]
  if { [string first 0 $sync_time_minutes] == 0 } {
    set sync_time_minutes [string replace $sync_time_minutes 0 0]
  }
  set sync_time_seconds  [clock format [clock seconds] -format "%S"]
  if { [string first 0 $sync_time_seconds] == 0 } {
    set sync_time_seconds [string replace $sync_time_seconds 0 0]
  }
  updateStatusSYNC "Copied system time and date to watch settings."
}


# Change all affected parameters to metric units / 24H time format
proc switch_to_metric_units {} {
  global w
  global sync_time_is_am sync_time_hours
  global sync_date_year sync_date_month sync_date_day
  global sync_temperature_24 sync_altitude_24
  global values_24
  global values_12
  global values_30
  global value_temperature_C
  global values_altitude_meters

  # Update 24H time
  update_time_12

  # Reconfigure hours
  $w.note.sync.f1.sb1 configure -textvariable sync_time_hours_24 -postcommand { check_time } -values $values_24
  $w.note.sync.ampm.rb1 configure -state disabled
  $w.note.sync.ampm.rb2 configure -state disabled
  
  # Configure date fields
  $w.note.sync.f2.l1 configure -text "Date (dd.mm.yyyy)"
  $w.note.sync.f2.sb1 configure -textvariable sync_date_day 	-values $values_30
  $w.note.sync.f2.sb2 configure -textvariable sync_date_month 	-values $values_12
  
  # Change temperature
  $w.note.sync.f4.l1 configure -text "Temperature (\u00B0C)" 
  $w.note.sync.f4.sb1 configure -textvariable sync_temperature_24 -values $value_temperature_C
   
  # Change altitude
  $w.note.sync.f5.l1 configure -text "Altitude (m)"
  $w.note.sync.f5.sb1 configure -textvariable sync_altitude_24 -values $values_altitude_meters
}

# Change all affected parameters to imperial units / 12H time format
proc switch_to_imperial_units {} {
  global w 
  global sync_time_is_am sync_time_hours
  global sync_date_year sync_date_month sync_date_day
  global sync_temperature_12 sync_temperature_24 sync_altitude_12
  global values_12 
  global values_30
  global value_temperature_F
  global values_altitude_feet
    
  # Update 12H time
  update_time_24
  
  	if {[string is digit -strict $sync_temperature_24]==0} { set sync_temperature_24 22}
    
  # Reconfigure hours
  $w.note.sync.f1.sb1 configure 	-textvariable sync_time_hours_12 -postcommand {update_time_12} -values $values_12
  $w.note.sync.ampm.rb1 configure 	-state normal
  $w.note.sync.ampm.rb2 configure 	-state normal
  
  # Change date
  $w.note.sync.f2.l1 configure 	-text "Date (mm.dd.yyyy)"     
  $w.note.sync.f2.sb1 configure -textvariable sync_date_month	-values $values_12
  $w.note.sync.f2.sb2 configure -textvariable sync_date_day   	-values $values_30
   
  # Change temperature
  $w.note.sync.f4.l1 configure 	-text "Temperature (\u00B0F)" 
  $w.note.sync.f4.sb1 configure -textvariable sync_temperature_12 -values $value_temperature_F
    
  # Change altitude
  $w.note.sync.f5.l1 configure 	-text "Altitude (ft)"
  $w.note.sync.f5.sb1 configure -textvariable sync_altitude_12 -values $values_altitude_feet
}


# Keep 24H and 12H time variable in sync
proc update_time_24 {} {
  global sync_use_metric_units sync_time_is_am sync_time_hours_24 sync_time_hours_12

  # Checks if the variable is a number. If not, set it to 1
  if {[string is digit -strict $sync_time_hours_24]==0} { set sync_time_hours_24 4}
  
  
  # Calculate 12H time  
  if { $sync_time_hours_24 == 0 } {
    set sync_time_hours_12 [expr $sync_time_hours_24 + 12]
    set sync_time_is_am 1
  } elseif { $sync_time_hours_24 <= 12 } {
    set sync_time_hours_12 $sync_time_hours_24
    set sync_time_is_am 1
  } else {
    set sync_time_hours_12 [expr $sync_time_hours_24 - 12]
    set sync_time_is_am 0 
  }
}

# Keep 24H and 12H time variable in sync
proc update_time_12 {} {
  global sync_use_metric_units sync_time_is_am sync_time_hours_24 sync_time_hours_12
  
  # Checks if the variable is a number. If not, set it to 1
  if {[string is digit -strict $sync_time_hours_12]==0} { set sync_time_hours_12 4}
  
  # Calculate 12H time 
  if { $sync_time_is_am == 1 } {
    if { $sync_time_hours_12 == 12 } { 
      set sync_time_hours_24 0 
    } else {
      set sync_time_hours_24 $sync_time_hours_12
    }
  } else {
  
    set sync_time_hours_24 [expr $sync_time_hours_12 + 12]
  }
}

# Trace altitude and temperature and update internal units
proc update_temperature args {
  global sync_use_metric_units sync_temperature_24 sync_temperature_12
  
  if {([string is digit -strict $sync_temperature_24 ]==1) && ([string is digit -strict $sync_temperature_12 ]==1)} {
  # Convert to internal format
  if { $sync_use_metric_units == 1 } {
    set sync_temperature_12 [format "%2.0f" [expr ($sync_temperature_24*9/5)+32]]
  } else {
    set sync_temperature_24 [format "%2.0f" [expr ($sync_temperature_12-32)/9*5]]
  }  
  }
}

proc update_altitude args {
  global sync_use_metric_units sync_altitude_24 sync_altitude_12
  
  # Convert to internal format
  if {([string is digit -strict $sync_altitude_24 ]==1) && ([string is digit -strict $sync_altitude_12 ]==1)} {
  if { $sync_use_metric_units == 1 } {
    set sync_altitude_12    [format "%4.0f" [expr $sync_altitude_24*3.28084]]
  } else {
    set sync_altitude_24    [format "%4.0f" [expr $sync_altitude_12/3.28084]]
  }
  }
}

trace add variable sync_temperature_24 	write update_temperature
trace add variable sync_temperature_12 	write update_temperature
#trace add variable sync_altitude_12 	write update_altitude
#trace add variable sync_date_day 		write check_date
#trace add variable sync_date_month 	write check_date
#trace add variable sync_date_year 		write check_date
#trace add variable sync_time_hours_24 	write check_time
#trace add variable sync_time_minutes 	write check_time        
#trace add variable sync_time_seconds 	write check_time

# ----------------------------------------------------------------------------------------
# BlueRobin functions --------------------------------------------------------------------

# Start BlueRobin transmission
proc start_bluerobin { } {
  global w bluerobin_on simpliciti_on
  global sweep_hr txid heartrate 
  global com_available
  global wbsl_on
  
  # No com port?  
  if { $com_available == 0} { return }

  # Already sending BlueRobin
  if { $bluerobin_on == 1 } { return } 

  # Wireless Update on?  
  if { $wbsl_on == 1 } { return }
  
  # SimpliciTI on?
  if { $simpliciti_on == 1 } { 
    stop_simpliciti_ap
    after 500
  } 
  
  updateStatusBR "Initialising BlueRobin transmitter."
  after 500

  # Set transmitter ID
  catch { BM_BR_SetID $txid } result
  if { $result == 0 } {
    updateStatusBR "Failed to set BlueRobin ID."
    return
  }
  after 500

  # Start BlueRobin channel 
  catch { BM_BR_Start } result
  if { $result == 0 } {
    updateStatusBR "Failed to start BlueRobin transmission."
    return
  }
  # Update status box  
  updateStatusBR "Starting BlueRobin heart rate transmission."
  after 500
  
  # Set auto receive mode flag after some waiting time  
  after 500
  set bluerobin_on 1
  
  # Reconfigure control button 
  $w.note.br.frame0.btnStartStop configure -text "Stop Transmitter" -command { stop_bluerobin }
}


# Stop BlueRobin transmission
proc stop_bluerobin { } {
  global w bluerobin_on simpliciti_on

  # Not on?
  if { $simpliciti_on == 1 || $bluerobin_on == 0 } { return } 

  # Clear on flag  
  set bluerobin_on 0

  # Stop BlueRobin channel 
  catch { BM_BR_Stop } result
  updateStatusBR "Stopping BlueRobin transmission."
  after 1000
  updateStatusBR "BlueRobin transmitter off."  
  
  # Reconfigure control button 
  $w.note.br.frame0.btnStartStop configure -text "Start Transmitter" -command { start_bluerobin }
}


# Set BlueRobin transmit data
proc update_br_data {} {
  global bluerobin_on heartrate speed distance speed_is_mph

  # BlueRobin off?
  if { $bluerobin_on == 0 } { return }
  
  # Send heart rate to RF access point 
  catch { BM_BR_SetHeartrate $heartrate } res

  # Convert english units to metric units
  if { $speed_is_mph == 1 } {
    set speed1 [format "%0.2f" [expr $speed/0.6214 + 0.049]]  
  } else {
    set speed1 $speed
  }

  # Calculate new distance (1km/h = 1000m/3600sec)
  # Use 0.1m resolution to enable speed < 3.6km/h
  set distance [expr $distance + ($speed1*1.5*10*1000/3600)]
  
  # Transmit distance [m] and speed [0.1m] in decimal format
  set distance1 [format "%.0f" [expr $distance/10 ]]
  set speedx [format "%.0f" [expr $speed1*10]]
  
  # Send updated speed/distance to RF access point  
  catch { BM_BR_SetSpeed $speedx $distance1 } res

  # Update status line  
  if { $speed_is_mph == 1 } {
    updateStatusBR "Transmitting heart rate ($heartrate bpm), speed ([format "%0.1f" $speed] mph) and distance ([format "%0.2f" [expr [format %f $distance1]/1000 * 0.621371192]] mls)."
  } else {
    updateStatusBR "Transmitting heart rate ($heartrate bpm), speed ([format "%0.1f" $speed] km/h) and distance ($distance1 m)."
  }
}  	  


# Automatically increase heart rate
proc inc_heartrate {} {
  global hr_sweep heartrate bluerobin_on
  
  # BlueRobin off?
  if { $bluerobin_on == 0 } { return }
  
  # Sweep heart rate
  if { $hr_sweep == 1 } {
    set heartrate [expr $heartrate + 1]
    if { $heartrate >= 220 } { set heartrate 40 }
  }
}


# Automatically increase speed
proc inc_speed {} {
  global speed_sweep speed speed_limit_hi bluerobin_on
  
  # BlueRobin off?
  if { $bluerobin_on == 0 } { return }
  
  # Sweep speed
  if { $speed_sweep == 1 } {
    set speed [expr $speed + 1]
    if { $speed >= $speed_limit_hi } { set speed 0 }
  }
}


# Change speed / distance format between km and miles
proc change_speed_unit {} {
  global w speed speed_limit_hi speed_is_mph speed_is_mph0
  
  # No change?
  if { $speed_is_mph == $speed_is_mph0 } { return }
  
  if { $speed_is_mph == 1} {
    # From metric to imperial units
    set speed [format "%0.1f" [expr $speed*0.6214]]
    set speed_limit_hi 15.5
  } else {
    # From imperial units to metric
    set speed [format "%0.1f" [expr $speed/0.6214]]
    set speed_limit_hi 25.0
  } 
  $w.note.br.scale_speed configure -to $speed_limit_hi
  
  # Remember current speed unit
  set speed_is_mph0 $speed_is_mph
} 




# ----------------------------------------------------------------------------------------
# WBSL Update functions ------------------------------------------------------------------

# Prompt the user to select a file
proc open_file {} {
	global select_input_file
	global w
	set types {
		{{CC430 Firmware} {.txt}					}
	}
	set select_input_file [tk_getOpenFile -title "Select File" -filetypes $types] 
	
}

# Start the Wireless update procedure, and put RF Access Point in RX mode
proc start_wbsl_ap {} {
  global w
  global simpliciti_on bluerobin_on com_available
  global wbsl_on select_input_file
  global wbsl_ap_started
  global fsize
  global fp
  global rData
  global rData_index
  global low_index
  global list_count maxPayload 
  global ram_updater_downloaded
  global wirelessUpdateStarted

  # init needed variables
  set rData [list]
  set rData_index 0
  set low_index 0
  
  # No com port?  
  if { $com_available == 0} { return }
  
  # Testing REMOVE
  # set ram_updater_downloaded 1
  
  set ram_updater_file "ram_based_updater.txt"
  
  if { $ram_updater_downloaded == 0 } {
	  # Check that the user has selected a file    
	  if { [string length $select_input_file] == 0 } {
	  		tk_dialog .dialog1 "No file selected" {Please select a watch firmware file (*.txt) to download to the watch.} info 0 OK
	  		return
	  }
	  
	  # Check that the file selected by the user has the extension .txt 
	  if { [string first ".txt" $select_input_file] == -1 } {
	  	    tk_dialog .dialog1 "Invalid .txt File" {The file selected is not a .txt file.} info 0 OK
	  		return
	  }
  }

  # First off check that the file trying to be downloaded has the right format
  catch { file size $select_input_file } fsize
  
  # Check if the file exist
  if { [string first "no such file" $fsize] != -1 } {
  	tk_dialog .dialog1 "File doesnt exist" {The selected file doesn't exist, please verify the path.} info 0 OK
  	return
  }
  
  # Open the file for reading
  catch { open $select_input_file r } fp
  fconfigure $fp -translation binary

  # read the first character of the file, it should be an @ symbol
  set test_at [read $fp 1]

  if { $test_at != "@" } { 
    tk_dialog .dialog1 "Invalid .txt File" {The .txt file is NOT formatted correctly.} info 0 OK
    close $fp
    return
  }
  
  # read the complete file
  set rawdata [read $fp $fsize]
  close $fp
  # Remove spaces, tabs, endlines from the data
  regsub -all {[ \r\t\nq]*} $rawdata "" stripped_data
  set lines 0
  # Divide the file by the symbol @ so that in each list there is data to be written consecutively at the address indicated by the first 2 bytes
  set datainlist [split $stripped_data "@"]
  set list_count 0
  set byteCounter 0
  
  # For each line, convert the ASCII format in which is saved to Raw HEX format
  foreach lines $datainlist {
  	set lines [join $lines]
  	regsub -all {[ \r\t\nq]*} $lines "" line
  	if { [catch { binary format H* $line } line] } {
  	      tk_dialog .dialog1 "Invalid .txt File" {The .txt file is NOT formatted correctly.} info 0 OK
  	      return
      } 
      lappend rData $line
      incr list_count
   }
  
  # Check if the RAM_UPDATER is not yet on the watch so that we download this first
  if { $ram_updater_downloaded == 0 } {
  	  # init needed variables
      set rData [list]
      set rData_index 0
      set low_index 0
      
	  catch { file size $ram_updater_file} fsize
	  
	  # Check that the RAM Updater file is present on the GUI working directory
	  if { [string first "no such file" $fsize] != -1 } {
	    	tk_dialog .dialog1 "No Updater File" {The RAM Updater File is not present on the working directory. Filename should be:ram_based_updater.txt} info 0 OK
	     return
	  }
	  
	  catch { open $ram_updater_file r } fp
	  fconfigure $fp -translation binary
	  
	  set test_at [read $fp 1]
	 
	  if { $test_at != "@" } { 
	  	tk_dialog .dialog1 "Invalid .txt File" {The ram_based_updater.txt file is NOT formatted correctly.} info 0 OK
	  	close $fp
	  	return
	  }
	  
	  set rawdata [read $fp $fsize]
	  close $fp
	  # Remove spaces, tabs, endlines from the data
	  regsub -all {[ \r\t\nq]*} $rawdata "" stripped_data
	  
	  set datainlist [split $stripped_data "@"]
	  set list_count 0
	  set byteCounter 0
	  foreach lines $datainlist {
	  		set lines [join $lines]
	  		regsub -all {[ \r\t\nq]*} $lines "" line
	  		if { [catch { binary format H* $line } line] } {
	  	    	  tk_dialog .dialog1 "Invalid .txt File" {The ram_based_updater.txt file is NOT formatted correctly.} info 0 OK
	  	    	  return
	  	    } 
	  	    lappend rData $line
	  	    incr list_count
	  	}
  }
  # In AP mode?
  if { $simpliciti_on == 1 } { 
    stop_simpliciti_ap
    after 500
  } 
  
  # In BlueRobin mode?
  if { $bluerobin_on == 1 } { 
    stop_bluerobin
    after 500
  } 

  updateStatusWBSL "Starting Wireless Update."
  after 200

  # Link with WBSL transmitter
  catch { BM_WBSL_Start } result
  if { $result == 0 } {
    updateStatusWBSL "Failed to start Wireless Update."
    return
  }
  
  catch { BM_WBSL_GetMaxPayload } result
  
  if { $result < 2 } {
  	updateStatusWBSL "Failed to start Wireless Update."
    return
   }
   
  set maxPayload $result
  
  # Calculate the number of packets needed to be sent
  
  #initialize the number of packets
  set fsize 0
  
  # sum up all the bytes to be sent
  foreach block $rData {
  	set byteCounter [string length $block]
  	set dByte [expr {double($byteCounter)}]
  	set dMax [expr {double($maxPayload)} ]
  	set temp [ceil [expr  $dByte / $dMax]]
  	set fsize [expr $fsize + $temp]
  }
    
  # Set on WBSL flag   
  set wbsl_on 1
  # Cancel out first received data
  set wbsl_ap_started 0
  
  # Reconfig buttons
  $w.note.wbsl.btnDwnld configure -text "Cancel Update" -command { stop_wbsl_ap }
  
}

# Stop the wireless update procedure
proc stop_wbsl_ap {} {
  global w
  global simpliciti_on bluerobin_on com_available wbsl_on
  global ram_updater_downloaded
  global wirelessUpdateStarted

  # AP off?
  if { $wbsl_on == 0 } { return }
  
  # Clear on flags  
  set wbsl_on 0
  set ram_updater_downloaded 0

  after 500
 
  catch { BM_WBSL_Stop } res

  # Show that link is inactive
  updateStatusWBSL "Wireless Update is off."

  update
  
  # Initialize the variable that tell us when the update procedure has been initiated by the Watch
  set wirelessUpdateStarted 0

  # Reconfig button and re-enable it in case the update procedure was started and it was disabled during the procedure
  $w.note.wbsl.btnDwnld configure -text "Update Chronos Watch" -command { start_wbsl_ap } -state enabled
  
}

proc get_wbsl_packet_status {} {
  global w
  global wbsl_on
  global wbsl_ap_started
  global fsize
  global fp
  global rData   
  global rData_index
  global low_index
  global list_count maxPayload
  global wbsl_opcode
  global ram_updater_downloaded
  
  set status 0
  
  # return if WBSL is not active  
  if { $wbsl_on == 0 } { return }
 
  # Check packet status
 catch { BM_WBSL_GetPacketStatus } status
 
  if { $status == 1 } {
    # WBSL_DISABLED Not started by watch
    return
  } elseif { $status == 2 } {
  	# WBSL Is processing a packet
  	return	
  } elseif { $status == 4 } {
	# Send the size of the file
	set packets [expr {int($fsize)} ]
	# send opcode 0 which is a info packet, which contains the total packets to be sent
	catch { BM_WBSL_SendData 0 $packets } status 
    # The next packet will contain an address
	set wbsl_opcode 1
  } elseif { $status == 8 } {
	# Send the next data packet
		
	if { $rData_index <  $list_count } {
		# Choose the appropriate block of data
		set data_block [lindex $rData $rData_index]
		# Get the size of the block of data, to know if we have sent all of the data in this block and move to the next
		set block_size [string length $data_block]
		# Read MaxPayload Bytes from the list
		set c_data [string range $data_block $low_index [expr $low_index + [expr $maxPayload - 1]]]
		
		# Send the read bytes to the dongle
		catch { BM_WBSL_SendData $wbsl_opcode $c_data } status 
		
		#update the low index
		set low_index [expr $low_index + $maxPayload]
		
		# Next packet is a normal data packet
		set wbsl_opcode 2
		
		if { $low_index >= $block_size } { 
			incr rData_index
			set 	low_index 0
			# Next packet will include an address at the beginning of the packet
			set wbsl_opcode 1
		}
	 }
  } else {
  	# ERROR only the previous options should be returned
    if { $ram_updater_downloaded == 0 } {
  		tk_dialog .dialog1 "Error in communication" {There was an error in the communication between the RF Access Point and the watch during the download to RAM. The watch should have reset itself. Please retry the update the same way as before.} info 0 OK
    } else {
      tk_dialog .dialog1 "Error in communication" {There was an error in the communication between the RF Access Point and the watch during the download to Flash. The watch is in a sleep mode now. Please press the "Update Chronos Watch" first and then press the down button on the watch to restart the update.} info 0 OK
    }
  	after 200
  	stop_wbsl_ap 
  	return
  }
}

# Get the global status of the AP, check if the state in which the GUI is, matches the state of the AP
proc get_wbsl_status {} {
  global w
  global wbsl_on
  global wbsl_ap_started wbsl_progress
  global ram_updater_downloaded
  global wirelessUpdateStarted
  global wbsl_timer_flag
  
  set status 0
  
  # return if WBSL is not active  
  if { $wbsl_on == 0 } { return }

  # Check if the flag has been set, which means the communication was lost while trying to link to download the update image
 if { $wbsl_timer_flag == 1 } {
	     tk_dialog .dialog1 "Error in communication" {There was an error in the communication between the AP and the Watch while trying to start the download to Flash. The watch should have reset itself. Please retry the update the same way as before.} info 0 OK
	     wbsl_reset_timer	     
	     after 300
	     stop_wbsl_ap
	     return
    }

  # Update status box  
  catch { BM_GetStatus } status
  
  if { $status == 9 } {
    # just starting AP
    updateStatusWBSL "Starting access point."
    return
  # Check if there was an error during the communication between the AP and the watch
  } elseif { $status == 11 || $status == 12 } {
  	
  	if { $ram_updater_downloaded == 0 } {
  		tk_dialog .dialog1 "Error in communication" {There was an error in the communication between the RF Access Point and the watch during the download to RAM. The watch should have reset itself. Please retry the update the same way as before.} info 0 OK
    } else {
        tk_dialog .dialog1 "Error in communication" {There was an error in the communication between the RF Access Point and the watch during the download to Flash. The watch is in sleep mode now. Please press the "Update Chronos Watch" first and then press the down button on the watch to restart the update.} info 0 OK
    }
	after 300
	stop_wbsl_ap 
	
  } elseif { $status == 10 } {
    
    # Read WBSL data from dongle
    catch { BM_WBSL_GetStatus } data
    
    if { $wbsl_ap_started == 0} {
    	if { $ram_updater_downloaded == 0 } {
      updateStatusWBSL "Access point started. Now start watch in rFbSL mode."
     } else {
     	updateStatusWBSL "Starting to download update image to watch."
     	# We will now try to link with the watch to start downloading the Update Image, we need a timer in case the communication is lost
     	# while trying to link, since for the linking to start, the Dongle normally waits until the watch initiates the procedure.
     	wbsl_set_timer 1
     	update
     }
      set wbsl_ap_started 1
      return
    } else {
   
      # Check if data is valid
      if { $data < 0 } {
        return
      } 
     
     set wbsl_progress $data
     
     if { $wbsl_progress != 0 } {
     	   
     	   if { $wirelessUpdateStarted == 0 } {
     	   	
     	   	  set wirelessUpdateStarted 1
     	      # Reconfig buttons
  		    $w.note.wbsl.btnDwnld configure -state disabled
  	     }
     	   
	     if { $ram_updater_downloaded == 1 } {
	     	 # The download to FLASH has started, we don't need the timer to keep running
	     	 wbsl_reset_timer
	     	 update
	    	  updateStatusWBSL "Downloading update image to watch. Progress: $wbsl_progress %"	
           
		    if { $wbsl_progress >= 100 } { 
		  	    updateStatusWBSL "Image has been successfully downloaded to the watch"	
		  	    after 1500
		  	    stop_wbsl_ap
		  	   }
		  	
	     } else {
	     	 updateStatusWBSL "Downloading the RAM Based Updater. Progress: $wbsl_progress %"	

	     	  if { $wbsl_progress >= 100 } { 
		  	    updateStatusWBSL "RAM Based Updater downloaded. Starting download of update image"	
		  	    set ram_updater_downloaded 1
		  	    catch { BM_WBSL_Stop } res
		  	    set wbsl_on 0
		  	    start_wbsl_ap
		  	   }
	     }
     }
      return
      }
   } 
}

# Stop and reset the timer variables
proc wbsl_reset_timer { } {
 	global wbsl_timer_enabled
 	global wbsl_timer_counter
 	global wbsl_timer_flag
 	global wbsl_timer_timeout
 	
 	set  wbsl_timer_counter  0
 	set  wbsl_timer_flag     0
 	set  wbsl_timer_timeout  0
 	set  wbsl_timer_enabled  0
 }

# Set the timeout variable and start the timer
proc wbsl_set_timer { timeout } {
 	global wbsl_timer_enabled
 	global wbsl_timer_counter
 	global wbsl_timer_flag
 	global wbsl_timer_timeout
 	
 	set  wbsl_timer_counter  0
 	set  wbsl_timer_flag     0
 	set  wbsl_timer_timeout  $timeout
 	set  wbsl_timer_enabled  1
 }

# Called every 2.5 seconds, acts as the timer, it only counts if it's enabled
proc wbsl_simple_timer {} {
 	global wbsl_timer_enabled
 	global wbsl_timer_counter
 	global wbsl_timer_flag
 	global wbsl_timer_timeout
 	
 	if { $wbsl_timer_enabled == 0 } { 
 	   return	
 	}
    	set wbsl_timer_counter [expr $wbsl_timer_counter+1]
    	if { $wbsl_timer_counter > $wbsl_timer_timeout } {
    	    	set wbsl_timer_flag 1
          set wbsl_timer_enabled 0
    }
    
}


# ----------------------------------------------------------------------------------------
# System functions -----------------------------------------------------------------------

# Periodic live check
proc check_rx_serial {} {
  global no_answer_from_dongle com_available

  # No com port?  
  if { $com_available == 0} { return }

  # Alive check - read product ID from RF access point
  catch { BM_GetID } res
  
  # Close COM if no valid serial was received (empty string "" or "0") was returned
  if { [string length $res] == 0 || $res == 0 } {
    incr no_answer_from_dongle
    if { $no_answer_from_dongle > 4 } {    
      set RS232Connected 0
      tk_dialog .dialog1 "Communication Error" {RF Access Point was removed. Press OK to close application.} info 0 OK
      exitpgm
    } 
  } else {
      set no_answer_from_dongle 0
  }
}


# Create Windows key events
proc button_set { btn } {
  global pd_m1 pd_m2 pd_s1
  global cb_m1_windows cb_m1_alt cb_m1_ctrl cb_m1_shift
  global cb_s1_windows cb_s1_alt cb_s1_ctrl cb_s1_shift
  global cb_m2_windows cb_m2_alt cb_m2_ctrl cb_m2_shift
  
  # Button select
  switch $btn {
    "M1"  { set pd          $pd_m1
            set cb_windows  $cb_m1_windows
            set cb_alt      $cb_m1_alt
            set cb_ctrl     $cb_m1_ctrl
            set cb_shift    $cb_m1_shift }
    "M2"  { set pd          $pd_m2
            set cb_windows  $cb_m2_windows
            set cb_alt      $cb_m2_alt
            set cb_ctrl     $cb_m2_ctrl
            set cb_shift    $cb_m2_shift }
    "S1"  { set pd          $pd_s1
            set cb_windows  $cb_s1_windows
            set cb_alt      $cb_s1_alt
            set cb_ctrl     $cb_s1_ctrl
            set cb_shift    $cb_s1_shift }
    default { return }
  }
  
  # Convert key to ASCII code
  set ascii_event1 0x00
  if { [string length $pd] == 1 } {
    # Send character
    scan $pd "%c" ascii_event1
    set ascii_event1 [format "0x%02X" $ascii_event1]
  } else {
    # Convert special keys
    switch $pd {
      "Space"         { set ascii_event1 0x20 }
      "Arrow-Left"    { set ascii_event1 0x25 } 
      "Arrow-Right"   { set ascii_event1 0x27 }
      "F5"            { set ascii_event1 0x74 }
    }
  }

  # Trigger key event
  catch { BM_SetKey $ascii_event1 $cb_windows $cb_alt $cb_ctrl $cb_shift } res
}


# ----------------------------------------------------------------------------------------
# Wave graph functions -------------------------------------------------------------------


# Add new wave samples and delete the oldest ones
proc add_wave_coords { } {
  global w
  global accel_x accel_y accel_z accel_x_offset accel_y_offset accel_z_offset
  global wave_x wave_y wave_z

  # cut away oldest sample
  set nb_of_samples [ expr [ llength $wave_x ] / 2 ]
  if { $nb_of_samples > 51 } {
    set wave_x [lreplace $wave_x 0 1]
    set wave_y [lreplace $wave_y 0 1]
    set wave_z [lreplace $wave_z 0 1]
  }

  # shift all waves to left --> decrease all x coordinates by 10
  set wave_temp { }
f  foreach {x y} $wave_x {
    if { $y != "" } { 
      lappend wave_temp [expr $x-10] $y
    }  
  }
  set wave_x $wave_temp

  set wave_temp { }
  foreach {x y} $wave_y {
    if { $y != "" } { 
      lappend wave_temp [expr $x-10] $y
    }  
  }
  set wave_y $wave_temp

  set wave_temp { }
  foreach {x y} $wave_z {
    if { $y != "" } { 
      lappend wave_temp [expr $x-10] $y
    }  
  }
  set wave_z $wave_temp
  
  # Map values to 100 pixel high window
  set new_x [expr 50 - ($accel_x / 35) ]
  set new_y [expr 50 - ($accel_y / 35) ]
  set new_z [expr 50 - ($accel_z / 35) ]
  if { $new_x > 99   } { set new_x 99 } 
  if { $new_y > 99   } { set new_y 99 } 
  if { $new_z > 99   } { set new_z 99 } 
  if { $new_x <  5   } { set new_x 5 } 
  if { $new_y <  5   } { set new_y 5 } 
  if { $new_z <  5   } { set new_z 5 } 
  
  # Append new samples
  lappend wave_x 500 $new_x
  lappend wave_y 500 $new_y
  lappend wave_z 500 $new_z
}

# Ensure that this this is an array
array set animationCallbacks {}

# Create a smoothed line and arrange for its coordinates to be the
# contents of the variable waveCoords.
#$w.note.spl.frame2x.canvas create line $wave_x -tags wave -width 1 -fill black -smooth 1
#$w.note.spl.frame2y.canvas create line $wave_y -tags wave -width 1 -fill black -smooth 1
#$w.note.spl.frame2z.canvas create line $wave_z -tags wave -width 1 -fill black -smooth 1

# 
proc waveCoordsTracer {w args} {
    global wave_x
    global wave_y
    global wave_z

    # Actual visual update will wait until we have finished
    # processing; Tk does that for us automatically.
    $w.note.spl.frame2x.canvas coords wave $wave_x
    $w.note.spl.frame2y.canvas coords wave $wave_y
    $w.note.spl.frame2z.canvas coords wave $wave_z
}
trace add variable wave_x write [list waveCoordsTracer $w]

proc move {} {
    # Theoretically 100 frames-per-second (==10ms between frames)
    global animationCallbacks
    set animationCallbacks(simpleWave) [after 10 move]
}

# Initialise our remaining animation variables
set animateAfterCallback {}

# Start the animation processing
move



# ----------------------------------------------------------------------------------------
# Status output functions ----------------------------------------------------------------

proc updateStatusBR { msg } {
  global w
  $w.note.br.frame0b.lblStatusText configure -text $msg
  update
}
proc updateStatusSPL { msg } {
  global w
  $w.note.spl.frame0b.lblStatusText configure -text $msg
  $w.note.sync.status.l2 configure -text $msg
  update
}
proc updateStatusSYNC { msg } {
  global w
  $w.note.sync.status.l2 configure -text $msg
  $w.note.spl.frame0b.lblStatusText configure -text $msg
  update
}
proc updateStatusWBSL { msg } {
  global w
  $w.note.wbsl.frame0b.lblStatusText configure -text $msg
  update
}

# ----------------------------------------------------------------------------------------
# Start / stop application ---------------------------------------------------------------

# Exit application
proc exitpgm {} {
  catch { stop_simpliciti_ap }
  catch { stop_bluerobin }
  catch { BM_CloseCOM }
  exit 0
}

# Identify RF access point and open COM port
proc openCOM {} {
  global com_port com_available

  # set COM port to dongle port
  catch { BM_GetCOM } com_port

  # No dongle detected?
  if { [string first "NOCOM" $com_port] != -1 } {
    set reply [ tk_dialog .dialog1 "No USB RF access point detected" {Do you want to launch the software anyway?} info 0 Yes No ]
    if { $reply == "1" } { 
      exitpgm 
    } 
    return
  }

  # BR_OpenCOM portname baudrate timeout rts dtr
  catch { BM_OpenCOM $com_port 115200 30 0 0 } result
  if { $result == 0 } {
    tk_dialog .dialog1 "Failed to open COM port" {Press OK to close application.} info 0 OK
    exitpgm
  } else {
    set com_available  1 
  }
}

proc check_time args {
	global sync_time_hours_12 sync_time_hours_24 sync_time_minutes sync_time_seconds
	global w
	
	if { $sync_time_hours_12 > 12 	} { set sync_time_hours_12 	1 	}
	if { $sync_time_hours_24 > 23 	} { set sync_time_hours_24 	4	}
	if { $sync_time_minutes  > 59 	} { set sync_time_minutes 	30 	}
	if { $sync_time_seconds  > 59 	} { set sync_time_seconds 	0	}
	
	if {[string is digit -strict $sync_time_hours_12 	]==0} { set sync_time_hours_12 	1}	
	if {[string is digit -strict $sync_time_hours_24	]==0} { set sync_time_hours_24 	0}	
	if {[string is digit -strict $sync_time_minutes	 	]==0} { set sync_time_minutes 	0}	
	if {[string is digit -strict $sync_time_seconds	 	]==0} { set sync_time_seconds 	0}		
	update_time_24
}

proc check_date args {
	global values_31 values_30 values_29 values_28
	global sync_date_day sync_date_month sync_date_year
	global w
	set actual_day $sync_date_day
	
	switch $sync_date_month {
		1 	{ 
			$w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_31 -postcommand {check_date }}
			
		3 	{
			$w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_31 -postcommand {check_date }}
			
		5 	{ 
			$w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_31 -postcommand {check_date }}
			
		7 	{ $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_31 -postcommand {check_date }}
			
		8 	{ $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_31 -postcommand {check_date }}
			
		10  { 
			$w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_31 -postcommand {check_date }}
			
		12 	{ $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_31 -postcommand {check_date }}

		4 	{ $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_30 -postcommand {check_date }}
		6 	{ $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_30 -postcommand {check_date }}
		9 	{ $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_30 -postcommand {check_date }
			set sync_date_day $actual_day  	
			}
		11	{ $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_30 -postcommand {check_date }}
		
	  # A year that is divisible by 4 is a leap year. (Y % 4) == 0
	  # Exception to rule 1: a year that is divisible by 100 is not a leap year. (Y % 100) != 0
	  # Exception to rule 2: a year that is divisible by 400 is a leap year. (Y % 400) == 0 
		2 	{
			if {( [expr $sync_date_year%4] == 0) && ([ expr $sync_date_year%100 != 0] || [expr $sync_date_year%400 == 0 ])} { $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_29 -postcommand {check_date } } \
				else { $w.note.sync.f2.sb1 configure -textvariable sync_date_day -values $values_28 -postcommand {check_date } }		
			}
	}
	
	# Set boundaries for variables	
	if { $sync_date_month 	>	12 ||	$sync_date_month	<	0  	} { set sync_date_month 1}
	if { $sync_date_day		<	0  || 	$sync_date_day  	>	31 	} { set sync_date_day 	1}
	if { $sync_date_year	<	0 } { set sync_date_year 	2010 }
	if {[string is digit -strict $sync_date_year]==0} { set sync_date_year	2010}
}

proc check_temperature {} {
	global w
	global sync_temperature_24 sync_temperature_12
	global sync_use_metric_units
	if { $sync_use_metric_units == 1 } {
	  if {[string is digit -strict $sync_temperature_24]==0} { set sync_temperature_24 22}	
	} else {
	  if {[string is digit -strict $sync_temperature_12]==0} { set sync_temperature_12 71}	
	}		
}

proc check_altitude {} {
	global w
	global sync_altitude_24 sync_altitude_12
	global sync_use_metric_units
	
	if { $sync_use_metric_units == 1 } {
	  if {[string is digit -strict $sync_altitude_24]==0} { set sync_altitude_24 430}	
	} else {
	  if {[string is digit -strict $sync_altitude_12]==0} { set sync_altitude_12 1411}
	}
}

# Execute function once at startup
openCOM

# Execute function once at startup
load_ini_file

# Reconfigure display

# Exit program
if { $exit_prog == 1 } { exitpgm }

# ----------------------------------------------------------------------------------------
# Periodic functions  --------------------------------------------------------------------
proc every {ms body} {eval $body; after $ms [info level 0]}
every 1500 { update_br_data }
every 3000 { inc_heartrate }
every 2000 { inc_speed }
every 25   { get_spl_data }
every 600  { check_rx_serial }
every 35   { get_wbsl_status }
every 15   { get_wbsl_packet_status }
every 2500 { wbsl_simple_timer }


# Mudancas
# proc check_time
# botoes mudados- combobox no pane sync
# combobox, verifica os dados de entrada.
# now it checks for leap years
# serie of tests for data in sync pane
# proc altitude and temperature
# 
