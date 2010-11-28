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
  tk_dialog .dialog1 "DLL not found" {Press OK to close application.} info 0 OK
  set exit_prog 1
}

# ----------------------------------------------------------------------------------------
# Global variables -----------------------------------------------------------------------

# Script revision number
set revision                1.0

# Ini file for variables
set ini_file                "ez430-Chronos-DL.ini"   
# COM port variables
set com_port                "COM1:"
set com_available           0
set no_answer_from_dongle   0
set sync_file               "ez430-Chronos-DL.ini"   

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
set sync_file               "ez430_chronos.bike"
set sync_data_log_mode      0
set sync_data_log_interval  1
set sync_data_log_bytes     0
set sync_data_log_mode_hr   0
set sync_data_log_mode_temp 1
set sync_data_log_mode_alt  1
set sync_data_log_mode_acc  0
set packets_max             [expr 8192/16]
set packets_expected        0
set sync_use_metric_units   1

for { set i 0 } { $i < $packets_max } {incr i } {
  set packet($i) "m"
}
for { set i 0 } { $i < 8192 } {incr i } {
  set hex_arr($i) 0
}

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

# ------------------------------------------------------------------------
# Report Procedures

proc clearCanvas {can} {
	foreach id [$can find all] { $can delete $id }
}

proc createGrid {} {
  global w
  
  $w.note.report.frame2.canvas create line {50 86 600 86} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {50 170 600 170} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {50 253 600 253} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {50 337 600 337} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {160 2 160 420} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {270 2 270 420} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {380 2 380 420} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {490 2 490 420} -width 1 -fill gray -dash 1
  $w.note.report.frame2.canvas create line {50 2 600 2 600 420 50 420 50 2} -width 1 -fill black
}

proc update_report { } {
  global w
  global varDate
  global waveSpeed waveDistance waveAltitude waveTemperature
  global cbSpeed cbDistance cbAltitude cbTemperature
  global maxSpeed maxDistance maxAltitude maxTemperature minAltitude minTemperature

  clearCanvas $w.note.report.frame2.canvas
  createGrid 
  
  if { $varDate == "" } return

  # Draw Speed Data
  if { $cbSpeed == 1 } { 
	$w.note.report.frame2.canvas create line $waveSpeed -width 2 -fill red -smooth 1 
	$w.note.report.frame2.canvas create text 45 15 -text "$maxSpeed km/h" -fill red -font "Helvetica 7 bold" -justify left -anchor se
	$w.note.report.frame2.canvas create text 45 390 -text "0 km/h" -fill red -font "Helvetica 7 bold" -justify left -anchor se
  }
  
  # Draw Distance Data
  if { $cbDistance == 1 } {
	$w.note.report.frame2.canvas create line $waveDistance -width 2 -fill black -smooth 1 
	$w.note.report.frame2.canvas create text 45 25 -text "$maxDistance km" -fill black -font "Helvetica 7 bold" -justify left -anchor se
	$w.note.report.frame2.canvas create text 45 400 -text "0 km" -fill black -font "Helvetica 7 bold" -justify left -anchor se
  }
  
  # Draw Altitude Data
  if { $cbAltitude == 1 } { 
    $w.note.report.frame2.canvas create line $waveAltitude -width 2 -fill blue -smooth 1 
	$w.note.report.frame2.canvas create text 45 35 -text "$maxAltitude m" -fill blue -font "Helvetica 7 bold" -justify left -anchor se
	$w.note.report.frame2.canvas create text 45 410 -text "$minAltitude m" -fill blue -font "Helvetica 7 bold" -justify left -anchor se
  }
  
  # Draw Temperature Data
  if { $cbTemperature == 1 } {
    $w.note.report.frame2.canvas create line $waveTemperature -width 2 -fill green -smooth 1 
	$w.note.report.frame2.canvas create text 45 45 -text "$maxTemperature C" -fill green -font "Helvetica 7 bold" -justify left -anchor se
	$w.note.report.frame2.canvas create text 45 420 -text "$minTemperature C" -fill green -font "Helvetica 7 bold" -justify left -anchor se
  }
}

proc generate_report { } {
  global dataSpeed dataDistance dataAltitude dataTemperature
  global waveSpeed waveDistance waveAltitude waveTemperature
  global varDate varDistance varTime varAvgSpeed varMaxSpeed varTemperature varAltitude
  global maxSpeed maxDistance maxAltitude maxTemperature minAltitude minTemperature
  global startSpeed

  # ------------------------------------------------------------------------
  # Adjust Speed data, scale and offset
  set maxSpeed 0
  set sumSpeed 0
  set countSpeed 0
  foreach {x y} $dataSpeed {
    if { $y > $maxSpeed } { 
      set maxSpeed $y
    }  
	set sumSpeed [expr ($sumSpeed + $y)]
	set countSpeed [expr ($countSpeed + 1)]
  }
  set varAvgSpeed [expr (10 * $sumSpeed/$countSpeed)]
  set varAvgSpeed [expr (3.6 * $varAvgSpeed/100)]
  set varAvgSpeed [format "%.1f" $varAvgSpeed]
  set varAvgSpeed "$varAvgSpeed km/h"  
  
  set varMaxSpeed [expr (3.6 * $startSpeed/10)]
  set varMaxSpeed "$varMaxSpeed km/h"  
  
  set maxSpeed [expr (36 * $maxSpeed/100)]
  set maxSpeed [expr ($maxSpeed/40 + 1) * 40]
  
  set scaleSpeed [expr 418.0 / $maxSpeed]
  set offsetSpeed [expr 0]
  
  # ------------------------------------------------------------------------
  # Adjust Distance data, scale and offset
  set maxDistance 0
  foreach {x y} $dataDistance {
    if { $y > $maxDistance } { 
      set maxDistance $y
    }  
  }
  set varDistance [format "%0.1f" [expr ($maxDistance/10000.0)]]
  set varDistance "$varDistance km"
  
  set maxDistance [expr ($maxDistance/10000) + 1]
  
  set scaleDistance [expr 418.0 / ($maxDistance*1000)]
  set offsetDistance [expr 0]
  
  # ------------------------------------------------------------------------
  # Adjust Altitude data, scale and offset
  set maxAltitude 0
  set minAltitude 10000
  foreach {x y} $dataAltitude {
    if { $y > $maxAltitude } { 
      set maxAltitude $y
    }  
	if { $y < $minAltitude } { 
      set minAltitude $y
    } 
  } 
  set varAltitude [expr ($maxAltitude - $minAltitude)]
  set varAltitude "$varAltitude m"
  
  set maxAltitude [expr (($maxAltitude/100) + 1) * 100]
  set minAltitude [expr (($minAltitude/100) - 1) * 100]
  
  if { $minAltitude < 0 } {	set minAltitude 0 }
  
  set scaleAltitude [expr 418.0 / ($maxAltitude-$minAltitude)]
  set offsetAltitude [expr ($minAltitude*$scaleAltitude)]  
  
  # ------------------------------------------------------------------------
  # Adjust Time data, scale and offset
  set maxTemperature 0
  set minTemperature 1000000
  set sumTemperature 0
  set countTemperature 0
  
  foreach {x y} $dataTemperature {
    if { $y > $maxTemperature } { 
      set maxTemperature $y
    }  
	if { $y < $minTemperature } { 
      set minTemperature $y
    } 
	set sumTemperature [expr ($sumTemperature + $y)]
	set countTemperature [expr ($countTemperature + 1)]
  }
  
  set varTemperature [expr (10 * $sumTemperature/$countTemperature)]
  set varTemperature [expr (1.0 * $varTemperature/100)]
  set varTemperature "$varTemperature C"
  
  set maxTemperature [expr (($maxTemperature/50) + 1) * 5]
  set minTemperature [expr (($minTemperature/50)) * 5]
  
  set scaleTemperature [expr 418.0 / ($maxTemperature-$minTemperature)]
  set offsetTemperature [expr ($minTemperature*$scaleTemperature)] 

  # ------------------------------------------------------------------------
  # Adjust Time data and scale
  set maxTime 0
  foreach {x y} $dataSpeed {
    if { $x > $maxTime } { 
      set maxTime $x
    }  
  }
  set hours [format "%0d" [expr $maxTime/3600]]
  set minutes [format "%0d" [expr $maxTime%3600/60]]
  set seconds [format "%02d" [expr $maxTime%3600%60]]
  
  set varTime ""
  if { $hours > 0 } { set varTime "$hours:" }
  set varTime "$varTime$minutes:$seconds"
 
  set scaleTime [expr 550.0/$maxTime]

  # ------------------------------------------------------------------------
  # Generate Waves
  foreach {x y} $dataSpeed {
	lappend waveSpeed 		[expr (50 + $x * $scaleTime)] [expr (420 - ([expr $y*3.6/10] * $scaleSpeed) + $offsetSpeed)] 
  }
  
  foreach {x y} $dataDistance {
	lappend waveDistance 	[expr (50 + $x * $scaleTime)] [expr (420 - ([expr $y/10.0] * $scaleDistance) + $offsetDistance)] 
  }
  
  foreach {x y} $dataAltitude {
	lappend waveAltitude 	[expr (50 + $x * $scaleTime)] [expr (420 - ($y * $scaleAltitude) + $offsetAltitude)] 
  }
  
  foreach {x y} $dataTemperature {
	lappend waveTemperature [expr (50 + $x * $scaleTime)] [expr (420 - ([expr $y/10.0] * $scaleTemperature) + $offsetTemperature)] 
  }
}


proc load_report_file { name } {
  global dataSpeed dataDistance dataAltitude dataTemperature
  global varDate varDistance varTime varAvgSpeed varMaxSpeed varTemperature varAltitude
  global startTime startDistance startSpeed
  
  catch { set fhandle [open $name r] } res

  # Exit if file is missing
  if { [string first "couldn't open" $res] == 0 } { return }
 
  fconfigure $fhandle -buffering line

  set offsetTime $startTime
  set offsetDistance $startDistance
  
  # Read file line by line
  while { ![eof $fhandle] } {
    # Get next line
	gets $fhandle line

    set data [ split $line "," ]	

	if { [lindex $data 0] == "S" } {
		set varDate [lindex $data 1]
		set maxSpeed [lindex $data 2]
		if { $maxSpeed > $startSpeed } { set startSpeed $maxSpeed }
	}
	
	if { [lindex $data 0] == "D" } {
		lappend dataSpeed [expr ($offsetTime + [lindex $data 1])] [lindex $data 2]
		lappend dataDistance [expr ($offsetTime + [lindex $data 1])] [expr ($offsetDistance + [lindex $data 3])]
		lappend dataAltitude [expr ($offsetTime + [lindex $data 1])] [ lindex $data 4 ]
		lappend dataTemperature [expr ($offsetTime + [lindex $data 1])] [ lindex $data 5 ]
		
		set startTime [expr ($offsetTime + [lindex $data 1])]
		set startDistance [expr ($offsetDistance + [ lindex $data 3 ])]
	}
    
  }
  close $fhandle  
}

proc load_report { } {
  global w
  global dataSpeed dataDistance dataAltitude dataTemperature
  global waveSpeed waveDistance waveAltitude waveTemperature
  global startTime startDistance startSpeed
  
  # Resets values
  set dataSpeed {}
  set dataDistance {}
  set dataAltitude {}
  set dataTemperature {}

  set waveSpeed {}
  set waveDistance {}
  set waveAltitude {}
  set waveTemperature {}

  set startTime 0
  set startDistance 0
  set startSpeed 0
  
  # Check for day, week, year
  
  # Load selected file  
  load_report_file [$w.note.report.frame2.combo1 get]
  
  # Generate
  generate_report
  
  # Update Chart
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
font configure TkDefaultFont -family "tahoma" -size 8

# Define basic window geometry
wm title . "Chronos Challenge - cBike Control Center v$revision"
wm geometry . 800x470
wm resizable . 1 1
wm iconname . "ttknote"
ttk::frame .f
pack .f -fill both -expand 1
set w .f

# Map keys to internal functions 
bind . <Key-q> { exitpgm }

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
#ttk::checkbutton $w.note.report.frame2.cb1 -text "Speed" -variable cbSpeed -style custom.cbRed -command {update_report}
ttk::checkbutton $w.note.report.frame2.cb1 -text "Speed" -variable cbSpeed -command {update_report}
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
update_report

# ----------------------------------------------------------------------------------------
# Sync pane ------------------------------------------------------------------------------
ttk::frame $w.note.sync -style custom.TFrame 
$w.note add $w.note.sync -text "SimpliciTI\u2122 Datalogger" -underline 0 -padding 2 
grid columnconfigure $w.note.sync {0 1} -weight 1 -uniform 1

# Buttons
ttk::labelframe $w.note.sync.f0 -borderwidth 0
ttk::button $w.note.sync.f0.btn_start_ap -text "Start Access Point" -command { start_simpliciti_ap } -width 16
ttk::button $w.note.sync.f0.btn_get_watch_settings -text "Read Watch" -command { sync_read_watch }  -width 16
ttk::button $w.note.sync.f0.btn_get_time_and_date -text "Copy System Time" -command { sync_get_time_and_date }  -width 15
ttk::button $w.note.sync.f0.btn_erase_mem -text "Erase memory" -command { sync_erase }  -width 16
grid $w.note.sync.f0 -row 0 -column 0 -pady 5 -padx 8 -sticky ew -columnspan 2
pack $w.note.sync.f0.btn_start_ap -side left -fill x  -padx 8
pack $w.note.sync.f0.btn_erase_mem -side right -fill x  -padx 8
pack $w.note.sync.f0.btn_get_watch_settings -side right -fill x  -padx 8

# Download data
ttk::labelframe $w.note.sync.fdl -borderwidth 0
ttk::button $w.note.sync.fdl.btn1 -text "Download" -command { sync_download } -width 16
ttk::label $w.note.sync.fdl.lbl -text "Save data to:" -anchor e -font "Helvetica 9"
entry $w.note.sync.fdl.entry -textvariable sync_file -width 40
ttk::button $w.note.sync.fdl.btn2 -text "Browse" -command "fileDialog $w $w.note.sync.fdl.entry save" -width 10
grid $w.note.sync.fdl -row 1 -column 0 -pady 5 -padx 8 -sticky ew -columnspan 2
pack $w.note.sync.fdl.btn1 -side left -fill x -padx 8
pack $w.note.sync.fdl.lbl -side left -fill x -padx 8
pack $w.note.sync.fdl.entry -side left -fill x -padx 8
pack $w.note.sync.fdl.btn2 -side left -fill x -padx 8

# Data log bytes
ttk::labelframe $w.note.sync.f8 -borderwidth 0
ttk::label $w.note.sync.f8.l1 -text "Bytes logged" -width 20 -font "Helvetica 10 bold"
entry $w.note.sync.f8.sb1 -textvariable sync_data_log_bytes -justify right -width 5 -state readonly
grid $w.note.sync.f8 -row 9 -column 0 -columnspan 1 -pady 0 -padx 10 -sticky ew
pack $w.note.sync.f8.l1  -side left -fill x
pack $w.note.sync.f8.sb1 -side left -fill x -padx 5

# Status
labelframe $w.note.sync.status -borderwidth 1 -background "Yellow"
ttk::label $w.note.sync.status.l1 -text "Status:" -font "Helvetica 10 bold" -background "Yellow"
ttk::label $w.note.sync.status.l2 -text "Access Point is off." -font "Helvetica 10" -background "Yellow"
grid $w.note.sync.status -row 10 -column 0 -pady 20 -padx 10 -sticky ew -columnspan 2
pack $w.note.sync.status.l1 -side left -fill x 
pack $w.note.sync.status.l2 -side left -fill x 

# ----------------------------------------------------------------------------------------
# About pane -----------------------------------------------------------------------------
ttk::frame $w.note.about -style custom.TFrame 
$w.note add $w.note.about -text "About" -underline 0 -padding 2
grid columnconfigure $w.note.about {0 1} -weight 1 -uniform 1

# SimpliciTI box
ttk::labelframe $w.note.about.s -borderwidth 1 
ttk::label $w.note.about.s.txt1 -font "Helvetica 12 bold" -justify "left" -width 4  -anchor center -style custom.TLabel -text "SimpliciTI\u2122"
ttk::label $w.note.about.s.txt2 -font "Helvetica 10" -width 80 -wraplength 550 -justify left -anchor n -style custom.TLabel \
-text "Chronos challenge.\
\n\n."
ttk::label $w.note.about.s.txt3 -font "Helvetica 10 bold" -wraplength 550 -justify left -anchor n -style custom.TLabel -text "Learn more about SimpliciTI\u2122 at http://www.ti.com/simpliciti"
grid $w.note.about.s -row 0 -column 0 -sticky new -pady 0 -columnspan 2
pack $w.note.about.s.txt1 -side top -fill x -pady 5 -padx 2m
pack $w.note.about.s.txt2 -side top -fill x -pady 0 -padx 2m
pack $w.note.about.s.txt3 -side top -fill x -pady 5 -padx 2m


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
proc start_simpliciti_ap { } {
  global w
  global simpliciti_on com_available
  global simpliciti_ap_started
 
  # No com port?  
  if { $com_available == 0} { return }
  
  # SimpliciTI on?
  if { $simpliciti_on == 1 } { return } 
    
  updateStatusSYNC "Starting access point."
  after 500

  # Link with SimpliciTI transmitter
  catch { BM_SPL_Start } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to start access point."
    return
  }
  after 500
    
  # Set on flag after some waiting time  
  set simpliciti_on 1
  # Cancel out first received data
  set simpliciti_ap_started 0
  
  # Reconfig buttons
  $w.note.sync.f0.btn_start_ap configure -text "Stop Access Point" -command { stop_simpliciti_ap }

  updateStatusSYNC "Access point started. Now start watch in sync mode."
}

# Stop RF access point
proc stop_simpliciti_ap {} {
  global w
  global simpliciti_on com_available
  global simpliciti_ap_started

  # AP off?
  if { $simpliciti_on == 0 } { return } 

  # Clear on flags  
  set simpliciti_on 0
  
  # Send sync exit command
  catch { BM_SYNC_SendCommand 7 } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to stop access point."
    return
  }
  after 750
  
  catch { BM_SPL_Stop } res

  # Show that link is inactive
  updateStatusSYNC "Access point is off."

  # Clear values
  set simpliciti_ap_started 0
  update
  
  # Reconfig button
  $w.note.sync.f0.btn_start_ap configure -text "Start Access Point" -command { start_simpliciti_ap }
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
  global sync_use_metric_units sync_time_is_am sync_time_hours_24 sync_time_hours_12 sync_time_minutes sync_time_seconds
  global sync_date_year sync_date_month sync_date_day
  global sync_data_log_bytes sync_data_log_mode sync_data_log_interval
  global sync_data_log_mode_hr sync_data_log_mode_temp sync_data_log_mode_alt sync_data_log_mode_acc
  global sync_temperature_24 sync_altitude_24 
  
  # AP not enabled?
  if { !$simpliciti_on } { return }
   
  # Dummy read to clean buffer
  catch { BM_SYNC_ReadBuffer } bin
  
  catch { BM_SYNC_SendCommand 2 } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to send command."
    return
  }
  updateStatusSYNC "Requesting watch data."

  # Wait for buffer to be filled with RX packet - or timeout
  set repeat 10
  while { $repeat > 0 } {
    after 100
    set status [ BM_SYNC_GetBufferStatus ]
    if { $status == 1 } {
      updateStatusSYNC "Received watch status information."
      set repeat 0
      catch { BM_SYNC_ReadBuffer } bin
      binary scan $bin H* hex
      
      # Decode received data    
      # Received hours is always 24H format
      set sync_use_metric_units   [expr ([expr 0x[string range $hex 2 3]] >> 7) & 0x01 ]
      set sync_time_hours_24      [expr [expr 0x[string range $hex 2 3]] & 0x7F]
      set sync_time_minutes       [expr 0x[string range $hex 4 5]]
      set sync_time_seconds       [expr 0x[string range $hex 6 7]]
      set sync_date_year          [expr 0x[string range $hex 8 11]]
      set sync_date_month         [expr 0x[string range $hex 12 13]]
      set sync_alarm_minutes      [expr 0x[string range $hex 18 19]]
      set sync_temperature_24     [format "%2.0f" [expr [expr [format "%2.1f" 0x[string range $hex 20 23]]]/10]]
      set sync_altitude_24        [expr 0x[string range $hex 24 27]]
      set sync_data_log_mode      [expr 0x[string range $hex 28 29]]
      set sync_data_log_interval  [expr 0x[string range $hex 30 31]]
      set sync_data_log_bytes     [expr 0x[string range $hex 32 35]]
      
      # Decode data log mode bits
      if { [expr $sync_data_log_mode & 0x01] } { 
        set sync_data_log_mode_hr 1 
      } else {
        set sync_data_log_mode_hr 0 
      }
      if { [expr $sync_data_log_mode & 0x02] } { 
        set sync_data_log_mode_temp 1 
      } else {
        set sync_data_log_mode_temp 0 
      }
      if { [expr $sync_data_log_mode & 0x04] } { 
        set sync_data_log_mode_alt 1 
      } else {
        set sync_data_log_mode_alt 0 
      }

	  return
      
    } else {
        set repeat [expr $repeat-1]
    }
  }
  updateStatusSYNC "Error: Did not receive watch status information."
}

# Write watch settings
proc sync_write_watch {} {
  global w simpliciti_on
  global sync_use_metric_units sync_time_is_am sync_time_hours_24 sync_time_hours_12 sync_time_minutes sync_time_seconds
  global sync_date_year sync_date_month sync_date_day
  global sync_data_log_mode sync_data_log_interval
  global sync_data_log_mode_hr sync_data_log_mode_temp sync_data_log_mode_alt sync_data_log_mode_acc
  global sync_temperature_24 sync_altitude_24
  global sync_temperature_12 sync_altitude_12
  
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
		if { $sync_temperature_24 < 0 }  { 
		} else {
			updateStatusSYNC "Invalid value for temperature."
			return
		}

	}	
	if {([string is digit -strict $sync_temperature_24]==0) && ($sync_use_metric_units == 0)} {
		update_temperature

	}
	if {([string is digit -strict $sync_altitude_24]==0) && ($sync_use_metric_units == 1)} {
		if { $sync_altitude_24 < 0 }  { 
		} else {
			updateStatusSYNC "Invalid value for altitude."
			return
		}	
	}    		
	if {([string is digit -strict $sync_altitude_12]==0) && ($sync_use_metric_units == 0)} {
		updateStatusSYNC "Invalid value for altitude."
		return
	}    
	if {([string is digit -strict $sync_altitude_24]==0) && ($sync_use_metric_units == 0)} {
		update_altitude
	}	
  	if {[string is digit -strict $sync_data_log_interval	]==0} {
		updateStatusSYNC "Invalid value for datalogger interval."
		return
	}
	
	if { $sync_time_minutes  > 59 	} { 	
		updateStatusSYNC "Invalid value for minutes."
		return	
	}
	if { $sync_time_seconds  > 59 	} {
		updateStatusSYNC "Invalid value for seconds."
		return
	}
	if { $sync_use_metric_units == 1 } {
		if { $sync_time_hours_24 > 23 } { 

			updateStatusSYNC "Invalid value for hours."
			return
		}
	} else {
		if { $sync_time_hours_12 > 12 } {
			updateStatusSYNC "Invalid value for hours."
			return
		}
	}
	if { $sync_date_month > 12 || $sync_date_month < 0 } {	
		updateStatusSYNC "Invalid value for month."	
		return
	}
	if { $sync_date_day	 < 0 ||  $sync_date_day  > 31 } {
		updateStatusSYNC "Invalid value for day."
		return
	}
	if { $sync_date_year	<	0 } { 
		updateStatusSYNC "Invalid value for year."
		return
	}	
	


  # AP not enabled?
	if { !$simpliciti_on } { 
		updateStatusSYNC "Access Point is off."
		return 
	}

  # Assemble mode bits  
  set sync_data_log_mode [expr ($sync_data_log_mode_hr&0x01) | (($sync_data_log_mode_temp<<1)&0x02) | (($sync_data_log_mode_alt<<2)&0x04)]

  # Assemble command string
  set cmd "BM_SYNC_SendCommand 3 "
  append cmd [format "0x%02X " [expr $sync_time_hours_24 | (($sync_use_metric_units<<7)&0x80)]]
  append cmd [format "0x%02X " $sync_time_minutes] 
  append cmd [format "0x%02X " $sync_time_seconds] 
  append cmd [format "0x%02X " [expr $sync_date_year >> 8]] 
  append cmd [format "0x%02X " [expr $sync_date_year & 0xFF]] 
  append cmd [format "0x%02X " $sync_date_month] 
  append cmd [format "0x%02X " $sync_date_day] 
  append cmd "0x00 "
  append cmd "0x00 "	
  set t1 [format "%.0f" [expr $sync_temperature_24*10]]
  append cmd [format "0x%02X " [expr $t1 >> 8]]
  append cmd [format "0x%02X " [expr $t1 & 0xFF]] 
  append cmd [format "0x%02X " [expr $sync_altitude_24 >> 8]]
  append cmd [format "0x%02X " [expr $sync_altitude_24 & 0xFF]] 
  append cmd [format "0x%02X " $sync_data_log_mode] 
  append cmd [format "0x%02X " $sync_data_log_interval]
  
  catch { eval $cmd } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to send data."
    return
  }
  updateStatusSYNC "Sent data to watch."
}

# Prompt the user to select a file
proc open_file {} {
	global select_input_file
	global w
	set types {
		{{CC430 Firmware} {.txt}					}
	}
	set select_input_file [tk_getOpenFile -title "Select File" -filetypes $types] 
	
}


# ----------------------------------------------------------------------------------------
# Status output functions ----------------------------------------------------------------
proc updateStatusSYNC { msg } {
  global w
  $w.note.sync.status.l2 configure -text $msg
  update
}

# ----------------------------------------------------------------------------------------
# Start / stop application ---------------------------------------------------------------
# Exit application
proc exitpgm {} {
  catch { stop_simpliciti_ap }
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

# Generic file browse dialog
proc fileDialog {w ent operation} {
	global selected_type
  
  # Define default file types
  set types {
  	{"eZ430-Chronos datalogger files"		{.log}	}
  	{"All files"		*}
  }

  # Use standard Windows file dialog 
  if {$operation == "open"} {
  	if {![info exists selected_type]} {
  	    set selected_type "eZ430-Chronos datalogger files"
  	}
    set file [tk_getOpenFile -filetypes $types -parent $w -typevariable selected_type]
  } else {
	 set file [tk_getSaveFile -filetypes $types -parent $w -initialfile Untitled -defaultextension .log]
  }
  
  # Copy selected file to entry
  if {[string compare $file ""]} {
  	$ent delete 0 end
  	$ent insert 0 $file
  	$ent xview end
  }
}

# Download packets, first in a burst, then missed packets packet-by-packet
proc sync_download {} {
  global w simpliciti_on
  global sync_data_log_bytes sync_file
  global packets_max packet packets_expected
  
  # AP not enabled?
  if { $simpliciti_on == 0 } { return }
  
  # No bytes to download?
  sync_read_watch 
  if { $sync_data_log_bytes == 0 } { return }

  updateStatusSYNC "Requesting watch data."
  
  # Dummy read to clean buffer
  catch { BM_SYNC_ReadBuffer } bin
  after 10
  
  # Calculate how many packets (1 packet = 16 bytes data) are available for download
  set packet_start      0
  set packet_end        [expr $sync_data_log_bytes / 16]
  set packets_expected  [expr $packet_end + 1]
  set packets_per_burst 50
  set packets_received  0
  
  # Prepare received packet buffer
  for { set i 0 } { $i < $packets_max } {incr i } {
    set packet($i) "m"
  }

  # Request packet bursts until all packets have been requested once
  for { set i 0 } { $i < $packets_expected } {set i [expr $i + $packets_per_burst]} {
    
    # Request burst 
    set start_hi [expr ($i >> 8) & 0xFF]
    set start_lo [expr $i & 0xFF]
    if { $packet_end > [expr $i + $packets_per_burst] } {
      set end_hi [expr (($i + $packets_per_burst - 1) >> 8) & 0xFF]
      set end_lo [expr ($i + $packets_per_burst - 1) & 0xFF]
    } else {
      # Last burst request
      set end_hi [expr ($packet_end >> 8) & 0xFF]
      set end_lo [expr $packet_end & 0xFF]
    }
    catch { BM_SYNC_SendCommand 4 $start_hi $start_lo $end_hi $end_lo } result
    
    # Wait for buffer to be filled - or timeout
    set repeat 200
    while { $repeat > 0 } {
      set status [ BM_SYNC_GetBufferStatus ]
      if { $status == 1 } {
        catch { BM_SYNC_ReadBuffer } bin
        binary scan $bin H* hex
        # Store packet 
          set idx [expr 0x[string range $hex 2 5]]
          if { $packet($idx) == "m" } { 
            set packet($idx) $hex    
            incr packets_received
            updateStatusSYNC "Received [format %4d [expr $packets_received*16]] bytes."
          }
        set repeat 10
      } else {
          set repeat [expr $repeat-1]
          after 2
      }
    }
  }

  # Clear buffer
  catch { BM_SYNC_ReadBuffer } bin
  
  # While packets are missing, download them separately (up to 90 missed packets)
  set packets_missed_count 1
  set repeats 0  
  while { $packets_missed_count > 0 && $repeats < 10 } {
  
    incr repeats
    
    # Create list of missed packets
    catch { unset packets_missed }
    set packets_missed_count 0
    for { set i 0 } { $i < $packets_expected } {incr i } {
      if { $packet($i) == "m" } { 
        lappend packets_missed $i
        incr packets_missed_count
      }
    }
    
    # Packets missed?
    if { $packets_missed_count > 0 } {
      # Request 9 packets per command
      set packets_single [lrange $packets_missed 0 8]
      # Add dummy packets
      while { [llength $packets_single] < 9 } {
        lappend packets_single [lindex $packets_missed 0]
      }
      # Split packet indizes into high and low byte
      for { set i 0 } { $i < 9 } {incr i } {
        set ps_hi($i) [expr ([lindex $packets_single $i] >> 8) & 0xFF]        
        set ps_lo($i) [expr  [lindex $packets_single $i] & 0xFF]        
      }

      # Request packets
      updateStatusSYNC "Requesting missed packets $packets_single"
      set cmd "BM_SYNC_SendCommand 5 "
      for { set i 0 } { $i < 9 } {incr i } {
        append cmd "$ps_hi($i) "
        append cmd "$ps_lo($i) "
      } 
      catch { eval $cmd } result
      if { $result == 0 } {
        updateStatusSYNC "Error: Failed to request missing packets."
        return
      }

      # Wait for buffer to be filled - or timeout
      set repeat 100
      while { $repeat > 0 } {
        set status [ BM_SYNC_GetBufferStatus ]
        if { $status == 1 } {
          catch { BM_SYNC_ReadBuffer } bin
          binary scan $bin H* hex
          # Store packet 
          set idx [expr 0x[string range $hex 2 5]]
          if { $packet($idx) == "m" } { 
            set packet($idx) $hex    
            incr packets_received
            updateStatusSYNC "Received [format %4d [expr $packets_received*16]] bytes."
          }
          set repeat 10
        } else {
            set repeat [expr $repeat-1]
            after 2
        }
      }
    }
  }
  
  # Output received data  
  if { $packets_received >= $packets_expected } { 
    sync_decode_data 
  } else {
    updateStatusSYNC "Error: Did not receive all logged data."
  }
  
  # Dummy read to clean buffer
  catch { BM_SYNC_ReadBuffer } bin

}

# Decode recorded data to bike report format
proc sync_decode_data {} {
  global sync_file sync_data_log_mode 
  global packets_max packet packets_expected
  global hex_arr
  global sync_use_metric_units
  
  updateStatusSYNC "Writing data to file."
  #set wp [open $sync_file w]
  #ez430_chronos.bike
  #set wp [open "Teste.bike" w]
  set data_bike ""
  set end_packet 0
  # Write raw data and create a hex array
  set decode 1
  set hex_arr_len 0
  set data_stream ""
  for { set i 0 } { $i < $packets_expected } {incr i } {

  # Uncomment the next line to write raw data to the file
  # puts $wp "$i $packet($i)"

    if { $packet($i) != "m" } { 
      for { set j 6 } { $j < 37 } { set j [expr $j+2] } {
        set hex_arr($hex_arr_len) 0x[string range $packet($i) $j [expr $j+1]]
        incr hex_arr_len
      }
    } else {
      set decode 0
    }
  }
  # Add a dummy byte of the eof
  set hex_arr($hex_arr_len)   0x00
  incr hex_arr_len

  # Data missing?
  if {!$decode } {
    updateStatusSYNC "Error: Not all data has been received."
    return 
  }
  
  # Decode data (format is lo-hi) and write to file
  set session 0  
  for { set i 0 } { $i < $hex_arr_len } {incr i } {
	
    # Markers can appear only at 16-bit boundaries
    if { $hex_arr($i)==0 && [expr $i%2]==1 } {
      set next_word [expr ($hex_arr([expr $i+2])<<8) | $hex_arr([expr $i+1])]
    } else {
      set next_word [expr ($hex_arr([expr $i+1])<<8) | $hex_arr($i)]
    }
    # Check for start marker
    if { $session == 0 } {
      if { $next_word == 0xFFFB } {
        set session 1
        # Decode header
        incr i
        incr i
        set rec_mode      [format "0x%02X" $hex_arr($i)]
        incr i
        set rec_interval  [format %02d $hex_arr($i)]
        incr i
        set rec_day       [format %02d $hex_arr($i)]
        incr i
        set rec_month     [format %02d $hex_arr($i)]
        incr i
        set rec_year      [expr $hex_arr($i) | ($hex_arr([expr $i+1])<<8)]
        incr i
        incr i
        set rec_hour      [format %02d $hex_arr($i)]
        incr i
        set rec_minute    [format %02d $hex_arr($i)]
        incr i
        set rec_second    [format %02d $hex_arr($i)]
        set start_time    [clock scan "$rec_year-$rec_month-$rec_day $rec_hour:$rec_minute:$rec_second" -format {%Y-%m-%d %H:%M:%S}]
        incr i
	 }
	 
    } elseif { $next_word == 0xFFFE } {
           # End marker found
           set session 0
		   
	} elseif { $next_word == 0xFFFC } {
	      incr i
          incr i   
     	  set byte0     $hex_arr($i)
          set byte1     $hex_arr([expr $i+1])
          set max_speed [format %d [expr [format %d [expr (($byte0<<8) | (($byte1)))]]]]
         # puts $wp "$byte0,$byte1"
          set end_packet 1	
          set i [expr $i+2-1]
    } else {
    	  if { $end_packet != 1 } {
		  # Get the next data set bytes
		  set byte0     $hex_arr($i)
		  set byte1     $hex_arr([expr $i+1])    
		  set byte2     $hex_arr([expr $i+2])    
		  set byte3     $hex_arr([expr $i+3])
		  set byte4     $hex_arr([expr $i+4])
		  set byte5     $hex_arr([expr $i+5])    
		  set byte6     $hex_arr([expr $i+6])    
		  set byte7     $hex_arr([expr $i+7])   
		  set byte8     $hex_arr([expr $i+8])
		  set byte9     $hex_arr([expr $i+9])    
		  set byte10    $hex_arr([expr $i+10])   
		  set byte11    $hex_arr([expr $i+11])
		  
		  set speed_log 0
		  set distance 0
		  set system_time 0
		  set rec_temp  0 
		  set rec_alt   0 	  
				 
		  # // system time & 0xff 
		  # // system time
		  # // speed
		  # // speed >>8
		  # // distance
		  # // distance >>8
		  # // distance >>16
		  # // distance >>24
		  # // temp >>4 
		  # // temp<<4 and altitude >>8
		  # // altitude &0xff
		  # // max_speed
		  # // max_speed >>8
			
		 # Decode data
		  set system_time [format %d [expr [format %d [expr (($byte0<<8) | (($byte1)))]]]]
		  set speed_log   [format %d [expr [format %d [expr (($byte2<<8) | (($byte3)))]]]]
		  set distance    [format %d [expr [format %d [expr (($byte4<<8) | (($byte5)))]]]]
		  set rec_temp    [format %d [expr [format %d [expr (($byte8<<4) | (($byte9>>4)&0x0F))]]]]
		  set rec_alt     [format %d [expr (($byte9&0x0F)<<8) | $byte10]]
					 
		  # Write data set to file
		  # time,speed,distance,altitude,temperature
		  # puts $wp "$byte0,$byte1,$byte2,$byte3,$byte4,$byte5,$byte6,$byte7,$byte8,$byte9,$byte10"
		  # puts $wp "D,$system_time,$speed_log,$distance,$rec_alt,$rec_temp"
		  append data_bike "D,$system_time,$speed_log,$distance,$rec_alt,$rec_temp\n"
       }
  		  # Move to next data set        
          set i [expr $i+12-1]
	}
  }

  # Save initial time, date and max speed
   #puts $wp "S,[clock format $start_time -format {%d.%m.%Y}] [clock format $start_time -format {%H:%M:%S}],$max_speed"
   append data_bike "S,[clock format $start_time -format {%d.%m.%Y}] [clock format $start_time -format {%H:%M:%S}],$max_speed"
   #close $wp
  
   set report_file [open "[clock format $start_time -format {%d-%m-%Y}] [clock format $start_time -format {%H-%M-%S}].bike" w]
   puts $report_file $data_bike
   close $report_file
  
  after 500
  updateStatusSYNC "Data download finished."
}

# Erase recorded data on watch
proc sync_erase {} {
  global w simpliciti_on 
  global sync_data_log_bytes
  
  # AP not enabled?
  if { !$simpliciti_on } { return }

  catch { BM_SYNC_SendCommand 6 } result
  if { $result == 0 } {
    updateStatusSYNC "Failed to send erase command."
    return
  }
  updateStatusSYNC "Sent erase command to watch."
  after 1000
  
  updateStatusSYNC "Updating watch status."
  sync_read_watch 
  # Check if erase was successful
  if { $sync_data_log_bytes != 0 } {
    updateStatusSYNC "Error: Memory erase or status update failed. Please try again."
  }
}



# Execute function once at startup
openCOM

# Reconfigure display

# Exit program
if { $exit_prog == 1 } { exitpgm }

# ----------------------------------------------------------------------------------------
# Periodic functions  --------------------------------------------------------------------
proc every {ms body} {eval $body; after $ms [info level 0]}


