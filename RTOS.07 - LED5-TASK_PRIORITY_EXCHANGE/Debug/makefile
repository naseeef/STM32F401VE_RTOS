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


BUILD_ARTIFACT_NAME := RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.list \

OBJCOPY_BIN += \
RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.bin \


# All Target
all: main-build

# Main-build Target
main-build: RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.elf secondary-outputs

# Tool invocations
RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.elf: $(OBJS) $(USER_OBJS) C:\Users\Naseef\Documents\STM32CubeIDE\RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE\STM32F407VGTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\Naseef\Documents\STM32CubeIDE\RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE\STM32F407VGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE.list"
	@echo 'Finished building: $@'
	@echo ' '

RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.bin RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.elf RTOS.07\ -\ LED5-TASK_PRIORITY_EXCHANGE.list RTOS.07\\ -\\ LED5-TASK_PRIORITY_EXCHANGE.elf default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
