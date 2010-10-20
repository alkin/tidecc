################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../simpliciti/Components/mrfi/mrfi.c 

OBJS += \
./simpliciti/Components/mrfi/mrfi.obj 

C_DEPS += \
./simpliciti/Components/mrfi/mrfi.pp 


# Each subdirectory must supply rules for building sources it contributes
simpliciti/Components/mrfi/mrfi.obj: ../simpliciti/Components/mrfi/mrfi.c $(GEN_SRCS) $(GEN_OPTS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --silicon_version=mspx -g -O2 --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --define=__CC430F6137__ --include_path="C:/Programme/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/driver" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/include" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/logic" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/bluerobin" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Applications/application/End Device" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/bsp" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/bsp/boards" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/bsp/drivers" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/bsp/drivers/code" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/bsp/mcus" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/mrfi" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/mrfi/radios" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/mrfi/smartrf" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/nwk" --include_path="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Components/nwk_applications" --diag_warning=225 --sat_reassoc=off --fp_reassoc=off --plain_char=unsigned --printf_support=minimal $(GEN_OPTS_QUOTED) --cmd_file="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Applications/configuration/smpl_nwk_config.dat" --cmd_file="C:/Dokumente und Einstellungen/anton/Eigene Dateien/workspace/ez430_chronos_datalogger/simpliciti/Applications/configuration/End Device/smpl_config.dat" --preproc_with_compile --preproc_dependency="simpliciti/Components/mrfi/mrfi.pp" --obj_directory="simpliciti/Components/mrfi" $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")
	@echo 'Finished building: $<'
	@echo ' '


