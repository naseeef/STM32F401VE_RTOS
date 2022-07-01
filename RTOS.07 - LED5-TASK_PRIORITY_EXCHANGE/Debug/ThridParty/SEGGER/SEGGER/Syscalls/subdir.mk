################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThridParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c 

OBJS += \
./ThridParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o 

C_DEPS += \
./ThridParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d 


# Each subdirectory must supply rules for building sources it contributes
ThridParty/SEGGER/SEGGER/Syscalls/%.o: ../ThridParty/SEGGER/SEGGER/Syscalls/%.c ThridParty/SEGGER/SEGGER/Syscalls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE/ThridParty/FreeRTOS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE/ThridParty/FreeRTOS/include" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE/ThridParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE/ThridParty/SEGGER/SEGGER" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE/ThridParty/SEGGER/OS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.07 - LED5-TASK_PRIORITY_EXCHANGE/ThridParty/SEGGER/Config" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-ThridParty-2f-SEGGER-2f-SEGGER-2f-Syscalls

clean-ThridParty-2f-SEGGER-2f-SEGGER-2f-Syscalls:
	-$(RM) ./ThridParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d ./ThridParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o

.PHONY: clean-ThridParty-2f-SEGGER-2f-SEGGER-2f-Syscalls

