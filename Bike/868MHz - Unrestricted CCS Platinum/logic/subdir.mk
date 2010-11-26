################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../logic/altitude.c \
../logic/battery.c \
../logic/clock.c \
../logic/distance.c \
../logic/light.c \
../logic/menu.c \
../logic/rfbike.c \
../logic/rfsimpliciti.c \
../logic/sensor.c \
../logic/speed.c 

OBJS += \
./logic/altitude.obj \
./logic/battery.obj \
./logic/clock.obj \
./logic/distance.obj \
./logic/light.obj \
./logic/menu.obj \
./logic/rfbike.obj \
./logic/rfsimpliciti.obj \
./logic/sensor.obj \
./logic/speed.obj 

C_DEPS += \
./logic/altitude.pp \
./logic/battery.pp \
./logic/clock.pp \
./logic/distance.pp \
./logic/light.pp \
./logic/menu.pp \
./logic/rfbike.pp \
./logic/rfsimpliciti.pp \
./logic/sensor.pp \
./logic/speed.pp 

OBJS__QTD += \
".\logic\altitude.obj" \
".\logic\battery.obj" \
".\logic\clock.obj" \
".\logic\distance.obj" \
".\logic\light.obj" \
".\logic\menu.obj" \
".\logic\rfbike.obj" \
".\logic\rfsimpliciti.obj" \
".\logic\sensor.obj" \
".\logic\speed.obj" 

C_DEPS__QTD += \
".\logic\altitude.pp" \
".\logic\battery.pp" \
".\logic\clock.pp" \
".\logic\distance.pp" \
".\logic\light.pp" \
".\logic\menu.pp" \
".\logic\rfbike.pp" \
".\logic\rfsimpliciti.pp" \
".\logic\sensor.pp" \
".\logic\speed.pp" 

C_SRCS_QUOTED += \
"../logic/altitude.c" \
"../logic/battery.c" \
"../logic/clock.c" \
"../logic/distance.c" \
"../logic/light.c" \
"../logic/menu.c" \
"../logic/rfbike.c" \
"../logic/rfsimpliciti.c" \
"../logic/sensor.c" \
"../logic/speed.c" 


# Each subdirectory must supply rules for building sources it contributes
logic/altitude.obj: ../logic/altitude.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/altitude_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/altitude_ccsCompiler.opt")
	$(shell echo -g >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/altitude.pp" >> "logic/altitude_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/altitude_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/altitude_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/altitude_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/altitude_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/battery.obj: ../logic/battery.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/battery_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/battery_ccsCompiler.opt")
	$(shell echo -g >> "logic/battery_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/battery_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/battery_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/battery_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/battery_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/battery_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/battery_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/battery.pp" >> "logic/battery_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/battery_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/battery_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/battery_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/battery_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/clock.obj: ../logic/clock.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/clock_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/clock_ccsCompiler.opt")
	$(shell echo -g >> "logic/clock_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/clock_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/clock_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/clock_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/clock_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/clock_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/clock_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/clock.pp" >> "logic/clock_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/clock_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/clock_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/clock_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/clock_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/distance.obj: ../logic/distance.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/distance_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/distance_ccsCompiler.opt")
	$(shell echo -g >> "logic/distance_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/distance_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/distance_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/distance_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/distance_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/distance_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/distance_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/distance.pp" >> "logic/distance_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/distance_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/distance_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/distance_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/distance_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/light.obj: ../logic/light.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/light_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/light_ccsCompiler.opt")
	$(shell echo -g >> "logic/light_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/light_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/light_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/light_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/light_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/light_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/light_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/light.pp" >> "logic/light_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/light_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/light_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/light_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/light_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/menu.obj: ../logic/menu.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/menu_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/menu_ccsCompiler.opt")
	$(shell echo -g >> "logic/menu_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/menu_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/menu_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/menu_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/menu_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/menu_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/menu_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/menu.pp" >> "logic/menu_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/menu_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/menu_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/menu_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/menu_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/rfbike.obj: ../logic/rfbike.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/rfbike_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo -g >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/rfbike.pp" >> "logic/rfbike_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/rfbike_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/rfbike_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/rfbike_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/rfbike_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/rfsimpliciti.obj: ../logic/rfsimpliciti.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo -g >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/rfsimpliciti.pp" >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/rfsimpliciti_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/rfsimpliciti_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/rfsimpliciti_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/sensor.obj: ../logic/sensor.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/sensor_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/sensor_ccsCompiler.opt")
	$(shell echo -g >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/sensor.pp" >> "logic/sensor_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/sensor_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/sensor_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/sensor_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/sensor_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/speed.obj: ../logic/speed.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/speed_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/speed_ccsCompiler.opt")
	$(shell echo -g >> "logic/speed_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/speed_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/speed_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/speed_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/speed_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/speed_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/speed_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/speed.pp" >> "logic/speed_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/speed_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/speed_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/speed_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/speed_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


