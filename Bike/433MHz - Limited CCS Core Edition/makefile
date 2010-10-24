################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

EMPTY := 
SPACE := $(EMPTY) $(EMPTY)

ORDERED_OBJS += \
$(GEN_CMDS_QUOTED) \
"./driver/rf1a.obj" \
"./driver/radio.obj" \
"./driver/ports.obj" \
"./logic/user.obj" \
"./logic/time.obj" \
"./logic/temperature.obj" \
"./logic/speed.obj" \
"./logic/rfsimpliciti.obj" \
"./logic/rfbsl.obj" \
"./logic/menu.obj" \
"./logic/distance.obj" \
"./logic/date.obj" \
"./logic/datalog.obj" \
"./logic/clock.obj" \
"./logic/bluerobin.obj" \
"./logic/battery.obj" \
"./logic/altitude.obj" \
"./logic/acceleration.obj" \
"./main.obj" \
-l"rts430x.lib" \
"../simpliciti/CC430_End_Device_433MHz.lib" \
"../lnk_cc430f6137.cmd" \
"../bluerobin/BlueRobin_RX_433MHz.lib" \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include simpliciti/subdir.mk
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
	@echo 'Invoking: Linker'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -vmspx -g -O4 --opt_for_speed=0 --define=__CCE__ --define=ISM_LF --diag_warning=225 --printf_support=minimal -z -m"ez430_chronos_datalogger_433MHz.map" --stack_size=80 --heap_size=80 --use_hw_mpy=F5 --warn_sections -i"C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/lib" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --reread_libs --rom_model -o "ez430_chronos_datalogger_433MHz.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(MSP430_EXECUTABLE_OUTPUTS__QTD) "ez430_chronos_datalogger_433MHz.out"
	-$(RM) ".\main.obj" ".\logic\acceleration.obj" ".\logic\altitude.obj" ".\logic\battery.obj" ".\logic\bluerobin.obj" ".\logic\clock.obj" ".\logic\datalog.obj" ".\logic\date.obj" ".\logic\distance.obj" ".\logic\menu.obj" ".\logic\rfbsl.obj" ".\logic\rfsimpliciti.obj" ".\logic\speed.obj" ".\logic\temperature.obj" ".\logic\time.obj" ".\logic\user.obj" ".\driver\ports.obj" ".\driver\radio.obj" ".\driver\rf1a.obj" 
	-$(RM) ".\main.pp" ".\logic\acceleration.pp" ".\logic\altitude.pp" ".\logic\battery.pp" ".\logic\bluerobin.pp" ".\logic\clock.pp" ".\logic\datalog.pp" ".\logic\date.pp" ".\logic\distance.pp" ".\logic\menu.pp" ".\logic\rfbsl.pp" ".\logic\rfsimpliciti.pp" ".\logic\speed.pp" ".\logic\temperature.pp" ".\logic\time.pp" ".\logic\user.pp" ".\driver\ports.pp" ".\driver\radio.pp" ".\driver\rf1a.pp" 
	-@echo ' '

post-build:
	-@echo 'Create flash image: TI-TXT'
	-"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/hex430.exe" --ti_txt "ez430_chronos_datalogger_433MHz.out" -o "ez430_chronos_datalogger_433MHz.txt" -order MS -romwidth 16
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
