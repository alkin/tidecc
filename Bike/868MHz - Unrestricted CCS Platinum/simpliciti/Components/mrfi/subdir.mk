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

OBJS__QTD += \
".\simpliciti\Components\mrfi\mrfi.obj" 

C_DEPS__QTD += \
".\simpliciti\Components\mrfi\mrfi.pp" 

C_SRCS_QUOTED += \
"../simpliciti/Components/mrfi/mrfi.c" 


# Each subdirectory must supply rules for building sources it contributes
simpliciti/Components/mrfi/mrfi.obj: ../simpliciti/Components/mrfi/mrfi.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo -vmspx >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo -g >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=peer --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --asm_listing >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --preproc_dependency="simpliciti/Components/mrfi/mrfi.pp" >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --obj_directory="simpliciti/Components/mrfi" >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "simpliciti/Components/mrfi/mrfi_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"simpliciti/Components/mrfi/mrfi_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


