################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c 

CMD_SRCS += \
../lnk_cc430f6137.cmd 

OBJS += \
./main.obj 

C_DEPS += \
./main.pp 


# Each subdirectory must supply rules for building sources it contributes
main.obj: ../main.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_LF --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --preproc_with_compile --preproc_dependency="main.pp" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '


