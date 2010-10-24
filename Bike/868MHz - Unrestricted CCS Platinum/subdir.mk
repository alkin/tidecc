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

OBJS__QTD += \
".\main.obj" 

C_DEPS__QTD += \
".\main.pp" 

C_SRCS_QUOTED += \
"../main.c" 


# Each subdirectory must supply rules for building sources it contributes
main.obj: ../main.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "main_ccsCompiler.opt")
	$(shell echo -vmspx >> "main_ccsCompiler.opt")
	$(shell echo -g >> "main_ccsCompiler.opt")
	$(shell echo -O2 >> "main_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "main_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "main_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "main_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "main_ccsCompiler.opt")
	$(shell echo --asm_listing >> "main_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "main_ccsCompiler.opt")
	$(shell echo --preproc_dependency="main.pp" >> "main_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "main_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "main_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"main_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


