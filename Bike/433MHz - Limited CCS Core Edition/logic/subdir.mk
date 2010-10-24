################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../logic/acceleration.c \
../logic/altitude.c \
../logic/battery.c \
../logic/bluerobin.c \
../logic/clock.c \
../logic/datalog.c \
../logic/date.c \
../logic/distance.c \
../logic/menu.c \
../logic/rfbsl.c \
../logic/rfsimpliciti.c \
../logic/speed.c \
../logic/temperature.c \
../logic/time.c \
../logic/user.c 

OBJS += \
./logic/acceleration.obj \
./logic/altitude.obj \
./logic/battery.obj \
./logic/bluerobin.obj \
./logic/clock.obj \
./logic/datalog.obj \
./logic/date.obj \
./logic/distance.obj \
./logic/menu.obj \
./logic/rfbsl.obj \
./logic/rfsimpliciti.obj \
./logic/speed.obj \
./logic/temperature.obj \
./logic/time.obj \
./logic/user.obj 

C_DEPS += \
./logic/acceleration.pp \
./logic/altitude.pp \
./logic/battery.pp \
./logic/bluerobin.pp \
./logic/clock.pp \
./logic/datalog.pp \
./logic/date.pp \
./logic/distance.pp \
./logic/menu.pp \
./logic/rfbsl.pp \
./logic/rfsimpliciti.pp \
./logic/speed.pp \
./logic/temperature.pp \
./logic/time.pp \
./logic/user.pp 

OBJS__QTD += \
".\logic\acceleration.obj" \
".\logic\altitude.obj" \
".\logic\battery.obj" \
".\logic\bluerobin.obj" \
".\logic\clock.obj" \
".\logic\datalog.obj" \
".\logic\date.obj" \
".\logic\distance.obj" \
".\logic\menu.obj" \
".\logic\rfbsl.obj" \
".\logic\rfsimpliciti.obj" \
".\logic\speed.obj" \
".\logic\temperature.obj" \
".\logic\time.obj" \
".\logic\user.obj" 

C_DEPS__QTD += \
".\logic\acceleration.pp" \
".\logic\altitude.pp" \
".\logic\battery.pp" \
".\logic\bluerobin.pp" \
".\logic\clock.pp" \
".\logic\datalog.pp" \
".\logic\date.pp" \
".\logic\distance.pp" \
".\logic\menu.pp" \
".\logic\rfbsl.pp" \
".\logic\rfsimpliciti.pp" \
".\logic\speed.pp" \
".\logic\temperature.pp" \
".\logic\time.pp" \
".\logic\user.pp" 

C_SRCS_QUOTED += \
"../logic/acceleration.c" \
"../logic/altitude.c" \
"../logic/battery.c" \
"../logic/bluerobin.c" \
"../logic/clock.c" \
"../logic/datalog.c" \
"../logic/date.c" \
"../logic/distance.c" \
"../logic/menu.c" \
"../logic/rfbsl.c" \
"../logic/rfsimpliciti.c" \
"../logic/speed.c" \
"../logic/temperature.c" \
"../logic/time.c" \
"../logic/user.c" 


# Each subdirectory must supply rules for building sources it contributes
logic/acceleration.obj: ../logic/acceleration.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/acceleration.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/altitude.obj: ../logic/altitude.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/altitude.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/battery.obj: ../logic/battery.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/battery.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/bluerobin.obj: ../logic/bluerobin.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/bluerobin.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/clock.obj: ../logic/clock.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/clock.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/datalog.obj: ../logic/datalog.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/datalog.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/date.obj: ../logic/date.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/date.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/distance.obj: ../logic/distance.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/distance.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/menu.obj: ../logic/menu.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/menu.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/rfbsl.obj: ../logic/rfbsl.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/rfbsl.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/rfsimpliciti.obj: ../logic/rfsimpliciti.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/rfsimpliciti.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/speed.obj: ../logic/speed.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/speed.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/temperature.obj: ../logic/temperature.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/temperature.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/time.obj: ../logic/time.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/time.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/user.obj: ../logic/user.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --diag_warning=225 --printf_support=minimal --preproc_with_compile --preproc_dependency="logic/user.pp" --obj_directory="logic" $(GEN_OPTS_QUOTED) $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '


