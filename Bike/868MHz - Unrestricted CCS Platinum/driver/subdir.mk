################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../driver/adc12.c \
../driver/buzzer.c \
../driver/display.c \
../driver/display1.c \
../driver/flash.c \
../driver/pmm.c \
../driver/ports.c \
../driver/radio.c \
../driver/rf1a.c \
../driver/timer.c \
../driver/vti_as.c \
../driver/vti_ps.c 

OBJS += \
./driver/adc12.obj \
./driver/buzzer.obj \
./driver/display.obj \
./driver/display1.obj \
./driver/flash.obj \
./driver/pmm.obj \
./driver/ports.obj \
./driver/radio.obj \
./driver/rf1a.obj \
./driver/timer.obj \
./driver/vti_as.obj \
./driver/vti_ps.obj 

C_DEPS += \
./driver/adc12.pp \
./driver/buzzer.pp \
./driver/display.pp \
./driver/display1.pp \
./driver/flash.pp \
./driver/pmm.pp \
./driver/ports.pp \
./driver/radio.pp \
./driver/rf1a.pp \
./driver/timer.pp \
./driver/vti_as.pp \
./driver/vti_ps.pp 

OBJS__QTD += \
".\driver\adc12.obj" \
".\driver\buzzer.obj" \
".\driver\display.obj" \
".\driver\display1.obj" \
".\driver\flash.obj" \
".\driver\pmm.obj" \
".\driver\ports.obj" \
".\driver\radio.obj" \
".\driver\rf1a.obj" \
".\driver\timer.obj" \
".\driver\vti_as.obj" \
".\driver\vti_ps.obj" 

C_DEPS__QTD += \
".\driver\adc12.pp" \
".\driver\buzzer.pp" \
".\driver\display.pp" \
".\driver\display1.pp" \
".\driver\flash.pp" \
".\driver\pmm.pp" \
".\driver\ports.pp" \
".\driver\radio.pp" \
".\driver\rf1a.pp" \
".\driver\timer.pp" \
".\driver\vti_as.pp" \
".\driver\vti_ps.pp" 

C_SRCS_QUOTED += \
"../driver/adc12.c" \
"../driver/buzzer.c" \
"../driver/display.c" \
"../driver/display1.c" \
"../driver/flash.c" \
"../driver/pmm.c" \
"../driver/ports.c" \
"../driver/radio.c" \
"../driver/rf1a.c" \
"../driver/timer.c" \
"../driver/vti_as.c" \
"../driver/vti_ps.c" 


# Each subdirectory must supply rules for building sources it contributes
driver/adc12.obj: ../driver/adc12.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/adc12_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/adc12_ccsCompiler.opt")
	$(shell echo -g >> "driver/adc12_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/adc12_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/adc12_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/adc12_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/adc12_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/adc12_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/adc12_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/adc12.pp" >> "driver/adc12_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/adc12_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/adc12_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/adc12_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/adc12_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/buzzer.obj: ../driver/buzzer.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/buzzer_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo -g >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/buzzer.pp" >> "driver/buzzer_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/buzzer_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/buzzer_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/buzzer_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/buzzer_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/display.obj: ../driver/display.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/display_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/display_ccsCompiler.opt")
	$(shell echo -g >> "driver/display_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/display_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/display_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/display_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/display_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/display_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/display_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/display.pp" >> "driver/display_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/display_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/display_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/display_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/display_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/display1.obj: ../driver/display1.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/display1_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/display1_ccsCompiler.opt")
	$(shell echo -g >> "driver/display1_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/display1_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/display1_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/display1_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/display1_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/display1_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/display1_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/display1.pp" >> "driver/display1_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/display1_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/display1_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/display1_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/display1_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/flash.obj: ../driver/flash.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/flash_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/flash_ccsCompiler.opt")
	$(shell echo -g >> "driver/flash_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/flash_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/flash_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/flash_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/flash_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/flash_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/flash_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/flash.pp" >> "driver/flash_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/flash_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/flash_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/flash_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/flash_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/pmm.obj: ../driver/pmm.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/pmm_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/pmm_ccsCompiler.opt")
	$(shell echo -g >> "driver/pmm_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/pmm_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/pmm_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/pmm_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/pmm_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/pmm_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/pmm_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/pmm.pp" >> "driver/pmm_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/pmm_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/pmm_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/pmm_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/pmm_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/ports.obj: ../driver/ports.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/ports_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/ports_ccsCompiler.opt")
	$(shell echo -g >> "driver/ports_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/ports_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/ports_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/ports_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/ports_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/ports_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/ports_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/ports.pp" >> "driver/ports_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/ports_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/ports_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/ports_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/ports_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/radio.obj: ../driver/radio.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/radio_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/radio_ccsCompiler.opt")
	$(shell echo -g >> "driver/radio_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/radio_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/radio_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/radio_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/radio_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/radio_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/radio_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/radio.pp" >> "driver/radio_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/radio_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/radio_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/radio_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/radio_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/rf1a.obj: ../driver/rf1a.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/rf1a_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo -g >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/rf1a.pp" >> "driver/rf1a_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/rf1a_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/rf1a_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/rf1a_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/rf1a_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/timer.obj: ../driver/timer.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/timer_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/timer_ccsCompiler.opt")
	$(shell echo -g >> "driver/timer_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/timer_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/timer_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/timer_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/timer_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/timer_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/timer_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/timer.pp" >> "driver/timer_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/timer_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/timer_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/timer_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/timer_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/vti_as.obj: ../driver/vti_as.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/vti_as_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo -g >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/vti_as.pp" >> "driver/vti_as_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/vti_as_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/vti_as_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/vti_as_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/vti_as_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

driver/vti_ps.obj: ../driver/vti_ps.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "driver/vti_ps_ccsCompiler.opt")
	$(shell echo -vmspx >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo -g >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo -O2 >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo --preproc_dependency="driver/vti_ps.pp" >> "driver/vti_ps_ccsCompiler.opt")
	$(shell echo --obj_directory="driver" >> "driver/vti_ps_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "driver/vti_ps_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "driver/vti_ps_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/CCSV4.2/ccsv4/tools/compiler/msp430/bin/cl430" -@"driver/vti_ps_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


