################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../simpliciti/Applications/application/End\ Device/main_ED_BM.c 

OBJS += \
./simpliciti/Applications/application/End\ Device/main_ED_BM.obj 

C_DEPS += \
./simpliciti/Applications/application/End\ Device/main_ED_BM.pp 

OBJS__QTD += \
".\simpliciti\Applications\application\End Device\main_ED_BM.obj" 

C_DEPS__QTD += \
".\simpliciti\Applications\application\End Device\main_ED_BM.pp" 

C_SRCS_QUOTED += \
"../simpliciti/Applications/application/End Device/main_ED_BM.c" 


# Each subdirectory must supply rules for building sources it contributes
simpliciti/Applications/application/End\ Device/main_ED_BM.obj: ../simpliciti/Applications/application/End\ Device/main_ED_BM.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\Patrick\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo -vmspx >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo -g >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=peer --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/driver" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/include" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/logic" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/bluerobin" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="C:/Users/Patrick/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --asm_listing >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --preproc_dependency="simpliciti/Applications/application/End Device/main_ED_BM.pp" >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(shell echo --obj_directory="simpliciti/Applications/application/End Device" >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"simpliciti/Applications/application/End Device/main_ED_BM_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


