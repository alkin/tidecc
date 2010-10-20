################################################################################
# Automatically-generated file. Do not edit!
################################################################################

EMPTY := 
SPACE := $(EMPTY) $(EMPTY)

ORDERED_OBJS += \
"./driver/vti_ps.obj" \
"./driver/vti_as.obj" \
"./driver/timer.obj" \
"./driver/rf1a.obj" \
"./driver/radio.obj" \
"./driver/ports.obj" \
"./driver/pmm.obj" \
"./driver/flash.obj" \
"./driver/display1.obj" \
"./driver/display.obj" \
"./driver/buzzer.obj" \
"./driver/adc12.obj" \
"./logic/user.obj" \
"./logic/temperature.obj" \
"./logic/rfsimpliciti.obj" \
"./logic/rfbsl.obj" \
"./logic/menu.obj" \
"./logic/date.obj" \
"./logic/datalog.obj" \
"./logic/clock.obj" \
"./logic/bluerobin.obj" \
"./logic/battery.obj" \
"./logic/altitude.obj" \
"./logic/acceleration.obj" \
"./main.obj" \
"./simpliciti/Applications/application/End Device/main_ED_BM.obj" \
"./simpliciti/Components/bsp/boards/CC430EM/bsp_board.obj" \
"./simpliciti/Components/mrfi/mrfi.obj" \
"./simpliciti/Components/nwk/nwk_globals.obj" \
"./simpliciti/Components/nwk/nwk_frame.obj" \
"./simpliciti/Components/nwk/nwk_api.obj" \
"./simpliciti/Components/nwk/nwk_QMgmt.obj" \
"./simpliciti/Components/nwk/nwk.obj" \
"./simpliciti/Components/nwk_applications/nwk_security.obj" \
"./simpliciti/Components/nwk_applications/nwk_ping.obj" \
"./simpliciti/Components/nwk_applications/nwk_mgmt.obj" \
"./simpliciti/Components/nwk_applications/nwk_link.obj" \
"./simpliciti/Components/nwk_applications/nwk_join.obj" \
"./simpliciti/Components/nwk_applications/nwk_ioctl.obj" \
"./simpliciti/Components/nwk_applications/nwk_freq.obj" \
-l"rts430x.lib" \
"../lnk_cc430f6137.cmd" \
"../bluerobin/BlueRobin_RX_433MHz.lib" \

-include ../makefile.init

RM := "C:/Programme/Texas Instruments/ccsv4/utils/Cygwin/rm" -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include simpliciti/Components/nwk_applications/subdir.mk
-include simpliciti/Components/nwk/subdir.mk
-include simpliciti/Components/mrfi/subdir.mk
-include simpliciti/Components/bsp/boards/CC430EM/subdir.mk
-include simpliciti/Applications/application/End\ Device/subdir.mk
-include logic/subdir.mk
-include driver/subdir.mk
-include bluerobin/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: ez430_chronos_datalogger_433MHz.out

# Tool invocations
ez430_chronos_datalogger_433MHz.out: $(GEN_CMDS) $(CMD_SRCS) $(OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MSP430 Linker'
	"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -z -m"ez430_chronos_datalogger.map" --stack_size=80 --heap_size=80 --use_hw_mpy=F5 --warn_sections -i"C:/Programme/Texas Instruments/ccsv4/msp430/include" -i"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/lib" -i"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/include" --reread_libs --rom_model -o "ez430_chronos_datalogger_433MHz.out" $(GEN_CMDS_QUOTED) $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(S62_DEPS)$(ASM_DEPS)$(C55_DEPS)$(S_UPPER_DEPS)$(S_DEPS)$(CPP_DEPS)$(C64_DEPS)$(C43_DEPS)$(C62_DEPS)$(OBJS)$(C??_DEPS)$(S??_DEPS)$(S55_DEPS)$(C_DEPS)$(C_UPPER_DEPS)$(SA_DEPS)$(MSP430_EXECUTABLE_OUTPUTS)$(C++_DEPS)$(CC_DEPS)$(S64_DEPS)$(CXX_DEPS)$(S43_DEPS)$(S67_DEPS)$(C67_DEPS)$(ASM_UPPER_DEPS)$(OPT_DEPS) "ez430_chronos_datalogger_433MHz.out"
	-@echo ' '

post-build:
	-@echo 'Create flash image: TI-TXT'
	-"C:/Programme/Texas Instruments/ccsv4/tools/compiler/msp430/bin/hex430.exe" --ti_txt "ez430_chronos_datalogger_433MHz.out" -o "ez430_chronos_datalogger_433MHz.txt" -order MS -romwidth 16
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
