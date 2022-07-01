################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThridParty/FreeRTOS/portable/MemMang/heap_4.c 

OBJS += \
./ThridParty/FreeRTOS/portable/MemMang/heap_4.o 

C_DEPS += \
./ThridParty/FreeRTOS/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
ThridParty/FreeRTOS/portable/MemMang/%.o: ../ThridParty/FreeRTOS/portable/MemMang/%.c ThridParty/FreeRTOS/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.04 - LED2-TASK_DELETION/ThridParty/FreeRTOS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.04 - LED2-TASK_DELETION/ThridParty/FreeRTOS/include" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.04 - LED2-TASK_DELETION/ThridParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.04 - LED2-TASK_DELETION/ThridParty/SEGGER/SEGGER" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.04 - LED2-TASK_DELETION/ThridParty/SEGGER/OS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.04 - LED2-TASK_DELETION/ThridParty/SEGGER/Config" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-ThridParty-2f-FreeRTOS-2f-portable-2f-MemMang

clean-ThridParty-2f-FreeRTOS-2f-portable-2f-MemMang:
	-$(RM) ./ThridParty/FreeRTOS/portable/MemMang/heap_4.d ./ThridParty/FreeRTOS/portable/MemMang/heap_4.o

.PHONY: clean-ThridParty-2f-FreeRTOS-2f-portable-2f-MemMang

