################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

EMPTY := 
SPACE := $(EMPTY) $(EMPTY)

ORDERED_OBJS += \
$(GEN_CMDS_QUOTED) \
"./main_LinkListen.obj" \
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

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include simpliciti/Components/nwk_applications/subdir.mk
-include simpliciti/Components/nwk/subdir.mk
-include simpliciti/Components/mrfi/subdir.mk
-include simpliciti/Components/bsp/boards/CC430EM/subdir.mk
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
all: ez430_chronos_datalogger.out

# Tool invocations
ez430_chronos_datalogger.out: $(GEN_CMDS) $(CMD_SRCS) $(OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Linker'
	$(shell echo --cmd_file="C:\Documents and Settings\x0144126.ENT\My Documents\workspace\New Folder\Chronos\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Documents and Settings\x0144126.ENT\My Documents\workspace\New Folder\Chronos\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "ccsLinker.opt")
	$(shell echo -vmspx >> "ccsLinker.opt")
	$(shell echo -g >> "ccsLinker.opt")
	$(shell echo -O4 >> "ccsLinker.opt")
	$(shell echo --opt_for_speed=0 >> "ccsLinker.opt")
	$(shell echo --define=__CCE__ --define=peer_interrupt --define=peer --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "ccsLinker.opt")
	$(shell echo --diag_warning=225 >> "ccsLinker.opt")
	$(shell echo --call_assumptions=0 >> "ccsLinker.opt")
	$(shell echo --auto_inline=0 >> "ccsLinker.opt")
	$(shell echo --gen_opt_info=2 >> "ccsLinker.opt")
	$(shell echo --printf_support=minimal >> "ccsLinker.opt")
	$(shell echo -z >> "ccsLinker.opt")
	$(shell echo -m"ez430_chronos_datalogger_868MHz.map" >> "ccsLinker.opt")
	$(shell echo --stack_size=80 >> "ccsLinker.opt")
	$(shell echo --heap_size=80 >> "ccsLinker.opt")
	$(shell echo --use_hw_mpy=F5 >> "ccsLinker.opt")
	$(shell echo --warn_sections >> "ccsLinker.opt")
	$(shell echo -i"C:/Program Files/Texas Instruments/CCS v4/ccsv4/msp430/include" -i"C:/Program Files/Texas Instruments/CCS v4/ccsv4/tools/compiler/msp430/lib" -i"C:/Program Files/Texas Instruments/CCS v4/ccsv4/tools/compiler/msp430/include" -i"C:/Program Files/Texas Instruments/CCS v4/ccsv4/msp430/include" >> "ccsLinker.opt")
	$(shell echo --reread_libs >> "ccsLinker.opt")
	$(shell echo --rom_model >> "ccsLinker.opt")
	$(shell type "ccsObjs.opt" >> "ccsLinker.opt")
	"C:/Program Files/Texas Instruments/CCS v4/ccsv4/tools/compiler/msp430/bin/cl430" -@"ccsLinker.opt" -o "ez430_chronos_datalogger.out"
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(MSP430_EXECUTABLE_OUTPUTS__QTD) "ez430_chronos_datalogger.out"
	-$(RM) ".\simpliciti\Components\nwk_applications\nwk_freq.obj" ".\simpliciti\Components\nwk_applications\nwk_ioctl.obj" ".\simpliciti\Components\nwk_applications\nwk_join.obj" ".\simpliciti\Components\nwk_applications\nwk_link.obj" ".\simpliciti\Components\nwk_applications\nwk_mgmt.obj" ".\simpliciti\Components\nwk_applications\nwk_ping.obj" ".\simpliciti\Components\nwk_applications\nwk_security.obj" ".\simpliciti\Components\nwk\nwk.obj" ".\simpliciti\Components\nwk\nwk_QMgmt.obj" ".\simpliciti\Components\nwk\nwk_api.obj" ".\simpliciti\Components\nwk\nwk_frame.obj" ".\simpliciti\Components\nwk\nwk_globals.obj" ".\simpliciti\Components\mrfi\mrfi.obj" ".\simpliciti\Components\bsp\boards\CC430EM\bsp_board.obj" ".\main_LinkListen.obj" 
	-$(RM) ".\simpliciti\Components\nwk_applications\nwk_freq.pp" ".\simpliciti\Components\nwk_applications\nwk_ioctl.pp" ".\simpliciti\Components\nwk_applications\nwk_join.pp" ".\simpliciti\Components\nwk_applications\nwk_link.pp" ".\simpliciti\Components\nwk_applications\nwk_mgmt.pp" ".\simpliciti\Components\nwk_applications\nwk_ping.pp" ".\simpliciti\Components\nwk_applications\nwk_security.pp" ".\simpliciti\Components\nwk\nwk.pp" ".\simpliciti\Components\nwk\nwk_QMgmt.pp" ".\simpliciti\Components\nwk\nwk_api.pp" ".\simpliciti\Components\nwk\nwk_frame.pp" ".\simpliciti\Components\nwk\nwk_globals.pp" ".\simpliciti\Components\mrfi\mrfi.pp" ".\simpliciti\Components\bsp\boards\CC430EM\bsp_board.pp" ".\main_LinkListen.pp" 
	-@echo ' '

post-build:
	-@echo 'Create flash image: TI-TXT'
	-"C:/Program Files/Texas Instruments/CCS v4/ccsv4/tools/compiler/msp430/bin/hex430.exe" --ti_txt "ez430_chronos_datalogger.out" -o "ez430_chronos_datalogger.txt" -order MS -romwidth 16
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
