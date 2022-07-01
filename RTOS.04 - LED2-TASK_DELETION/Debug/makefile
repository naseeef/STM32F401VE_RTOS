################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include ThridParty/SEGGER/SEGGER/Syscalls/subdir.mk
-include ThridParty/SEGGER/SEGGER/subdir.mk
-include ThridParty/SEGGER/OS/subdir.mk
-include ThridParty/SEGGER/Config/subdir.mk
-include ThridParty/FreeRTOS/portable/MemMang/subdir.mk
-include ThridParty/FreeRTOS/portable/GCC/ARM_CM4F/subdir.mk
-include ThridParty/FreeRTOS/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := RTOS.04 - LED2-TASK_DELETION
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
RTOS.04\ -\ LED2-TASK_DELETION.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
RTOS.04\ -\ LED2-TASK_DELETION.list \

OBJCOPY_BIN += \
RTOS.04\ -\ LED2-TASK_DELETION.bin \


# All Target
all: main-build

# Main-build Target
main-build: RTOS.04\ -\ LED2-TASK_DELETION.elf secondary-outputs

# Tool invocations
RTOS.04\ -\ LED2-TASK_DELETION.elf: $(OBJS) $(USER_OBJS) C:\Users\Naseef\Documents\STM32CubeIDE\RTOS.04\ -\ LED2-TASK_DELETION\STM32F407VGTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "RTOS.04 - LED2-TASK_DELETION.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\Naseef\Documents\STM32CubeIDE\RTOS.04 - LED2-TASK_DELETION\STM32F407VGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="RTOS.04 - LED2-TASK_DELETION.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

RTOS.04\ -\ LED2-TASK_DELETION.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "RTOS.04 - LED2-TASK_DELETION.list"
	@echo 'Finished building: $@'
	@echo ' '

RTOS.04\ -\ LED2-TASK_DELETION.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "RTOS.04 - LED2-TASK_DELETION.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) RTOS.04\ -\ LED2-TASK_DELETION.bin RTOS.04\ -\ LED2-TASK_DELETION.elf RTOS.04\ -\ LED2-TASK_DELETION.list RTOS.04\\ -\\ LED2-TASK_DELETION.elf default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
