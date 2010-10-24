################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../logic/acceleration.c \
../logic/altitude.c \
../logic/battery.c \
../logic/bluerobin.c \
../logic/clock.c \
../logic/datalog.c \
../logic/date.c \
../logic/distance.c \
../logic/menu.c \
../logic/rfbsl.c \
../logic/rfsimpliciti.c \
../logic/speed.c \
../logic/temperature.c \
../logic/user.c 

OBJS += \
./logic/acceleration.obj \
./logic/altitude.obj \
./logic/battery.obj \
./logic/bluerobin.obj \
./logic/clock.obj \
./logic/datalog.obj \
./logic/date.obj \
./logic/distance.obj \
./logic/menu.obj \
./logic/rfbsl.obj \
./logic/rfsimpliciti.obj \
./logic/speed.obj \
./logic/temperature.obj \
./logic/user.obj 

C_DEPS += \
./logic/acceleration.pp \
./logic/altitude.pp \
./logic/battery.pp \
./logic/bluerobin.pp \
./logic/clock.pp \
./logic/datalog.pp \
./logic/date.pp \
./logic/distance.pp \
./logic/menu.pp \
./logic/rfbsl.pp \
./logic/rfsimpliciti.pp \
./logic/speed.pp \
./logic/temperature.pp \
./logic/user.pp 

OBJS__QTD += \
".\logic\acceleration.obj" \
".\logic\altitude.obj" \
".\logic\battery.obj" \
".\logic\bluerobin.obj" \
".\logic\clock.obj" \
".\logic\datalog.obj" \
".\logic\date.obj" \
".\logic\distance.obj" \
".\logic\menu.obj" \
".\logic\rfbsl.obj" \
".\logic\rfsimpliciti.obj" \
".\logic\speed.obj" \
".\logic\temperature.obj" \
".\logic\user.obj" 

C_DEPS__QTD += \
".\logic\acceleration.pp" \
".\logic\altitude.pp" \
".\logic\battery.pp" \
".\logic\bluerobin.pp" \
".\logic\clock.pp" \
".\logic\datalog.pp" \
".\logic\date.pp" \
".\logic\distance.pp" \
".\logic\menu.pp" \
".\logic\rfbsl.pp" \
".\logic\rfsimpliciti.pp" \
".\logic\speed.pp" \
".\logic\temperature.pp" \
".\logic\user.pp" 

C_SRCS_QUOTED += \
"../logic/acceleration.c" \
"../logic/altitude.c" \
"../logic/battery.c" \
"../logic/bluerobin.c" \
"../logic/clock.c" \
"../logic/datalog.c" \
"../logic/date.c" \
"../logic/distance.c" \
"../logic/menu.c" \
"../logic/rfbsl.c" \
"../logic/rfsimpliciti.c" \
"../logic/speed.c" \
"../logic/temperature.c" \
"../logic/user.c" 


# Each subdirectory must supply rules for building sources it contributes
logic/acceleration.obj: ../logic/acceleration.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/acceleration_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo -g >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/acceleration.pp" >> "logic/acceleration_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/acceleration_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/acceleration_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/acceleration_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/acceleration_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/altitude.obj: ../logic/altitude.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/altitude_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/altitude_ccsCompiler.opt")
	$(shell echo -g >> "logic/altitude_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/altitude_ccsCompiler.opt")
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
	$(shell echo -O2 >> "logic/battery_ccsCompiler.opt")
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

logic/bluerobin.obj: ../logic/bluerobin.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/bluerobin_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo -g >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/bluerobin.pp" >> "logic/bluerobin_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/bluerobin_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/bluerobin_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/bluerobin_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/bluerobin_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/clock.obj: ../logic/clock.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/clock_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/clock_ccsCompiler.opt")
	$(shell echo -g >> "logic/clock_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/clock_ccsCompiler.opt")
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

logic/datalog.obj: ../logic/datalog.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/datalog_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/datalog_ccsCompiler.opt")
	$(shell echo -g >> "logic/datalog_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/datalog.pp" >> "logic/datalog_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/datalog_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/datalog_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/datalog_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/datalog_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/date.obj: ../logic/date.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/date_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/date_ccsCompiler.opt")
	$(shell echo -g >> "logic/date_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/date_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/date_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/date_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/date_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/date_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/date_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/date_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/date.pp" >> "logic/date_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/date_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/date_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/date_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/date_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/distance.obj: ../logic/distance.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/distance_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/distance_ccsCompiler.opt")
	$(shell echo -g >> "logic/distance_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/distance_ccsCompiler.opt")
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

logic/menu.obj: ../logic/menu.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/menu_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/menu_ccsCompiler.opt")
	$(shell echo -g >> "logic/menu_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/menu_ccsCompiler.opt")
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

logic/rfbsl.obj: ../logic/rfbsl.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/rfbsl_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo -g >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/rfbsl.pp" >> "logic/rfbsl_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/rfbsl_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/rfbsl_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/rfbsl_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/rfbsl_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/rfsimpliciti.obj: ../logic/rfsimpliciti.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo -g >> "logic/rfsimpliciti_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/rfsimpliciti_ccsCompiler.opt")
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

logic/speed.obj: ../logic/speed.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/speed_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/speed_ccsCompiler.opt")
	$(shell echo -g >> "logic/speed_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/speed_ccsCompiler.opt")
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

logic/temperature.obj: ../logic/temperature.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/temperature_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/temperature_ccsCompiler.opt")
	$(shell echo -g >> "logic/temperature_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/temperature.pp" >> "logic/temperature_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/temperature_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/temperature_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/temperature_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/temperature_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

logic/user.obj: ../logic/user.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="R:\Documentos\Chronos\tidecc\Bike\simpliciti\Applications\configuration\End Device\smpl_config.dat" > "logic/user_ccsCompiler.opt")
	$(shell echo -vmspx >> "logic/user_ccsCompiler.opt")
	$(shell echo -g >> "logic/user_ccsCompiler.opt")
	$(shell echo -O2 >> "logic/user_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=ISM_EU --define=MRFI_CC430 --define=__CC430F6137__ >> "logic/user_ccsCompiler.opt")
	$(shell echo --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Texas Instruments/ccsv4/msp430/include" --include_path="R:/Documentos/Chronos/tidecc/Bike" --include_path="R:/Documentos/Chronos/tidecc/Bike/driver" --include_path="R:/Documentos/Chronos/tidecc/Bike/include" --include_path="R:/Documentos/Chronos/tidecc/Bike/logic" --include_path="R:/Documentos/Chronos/tidecc/Bike/bluerobin" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Applications/application/End Device" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/drivers/code" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/bsp/mcus" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/radios/family5" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/mrfi/smartrf" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk" --include_path="R:/Documentos/Chronos/tidecc/Bike/simpliciti/Components/nwk_applications" >> "logic/user_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "logic/user_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "logic/user_ccsCompiler.opt")
	$(shell echo --asm_listing >> "logic/user_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "logic/user_ccsCompiler.opt")
	$(shell echo --preproc_dependency="logic/user.pp" >> "logic/user_ccsCompiler.opt")
	$(shell echo --obj_directory="logic" >> "logic/user_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "logic/user_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "logic/user_ccsCompiler.opt"))
	"C:/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"logic/user_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


