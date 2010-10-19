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
../logic/menu.c \
../logic/rfbsl.c \
../logic/rfsimpliciti.c \
../logic/temperature.c \
../logic/user.c 

OBJS += \
./logic/acceleration.obj \
./logic/altitude.obj \
./logic/battery.obj \
./logic/bluerobin.obj \
./logic/clock.obj \
./logic/datalog.obj \
./logic/date.obj \
./logic/menu.obj \
./logic/rfbsl.obj \
./logic/rfsimpliciti.obj \
./logic/temperature.obj \
./logic/user.obj 

C_DEPS += \
./logic/acceleration.pp \
./logic/altitude.pp \
./logic/battery.pp \
./logic/bluerobin.pp \
./logic/clock.pp \
./logic/datalog.pp \
./logic/date.pp \
./logic/menu.pp \
./logic/rfbsl.pp \
./logic/rfsimpliciti.pp \
./logic/temperature.pp \
./logic/user.pp 


# Each subdirectory must supply rules for building sources it contributes
logic/acceleration.obj: ../logic/acceleration.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/acceleration.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/altitude.obj: ../logic/altitude.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/altitude.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/battery.obj: ../logic/battery.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/battery.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/bluerobin.obj: ../logic/bluerobin.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/bluerobin.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/clock.obj: ../logic/clock.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/clock.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/datalog.obj: ../logic/datalog.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/datalog.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/date.obj: ../logic/date.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/date.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/menu.obj: ../logic/menu.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/menu.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/rfbsl.obj: ../logic/rfbsl.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/rfbsl.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/rfsimpliciti.obj: ../logic/rfsimpliciti.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/rfsimpliciti.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/temperature.obj: ../logic/temperature.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/temperature.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '

logic/user.obj: ../logic/user.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_EU --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="logic/user.pp" --obj_directory="logic" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '


