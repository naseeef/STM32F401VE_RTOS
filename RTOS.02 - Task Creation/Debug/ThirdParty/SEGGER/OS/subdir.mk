################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThirdParty/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.c 

OBJS += \
./ThirdParty/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.o 

C_DEPS += \
./ThirdParty/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
ThirdParty/SEGGER/OS/%.o: ../ThirdParty/SEGGER/OS/%.c ThirdParty/SEGGER/OS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.02 - Task Creation/ThirdParty/SEGGER/Config" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.02 - Task Creation/ThirdParty/SEGGER/OS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.02 - Task Creation/ThirdParty/SEGGER/SEGGER" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.02 - Task Creation/ThirdParty/FreeRTOS/include" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.02 - Task Creation/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.02 - Task Creation/ThirdParty/FreeRTOS" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-ThirdParty-2f-SEGGER-2f-OS

clean-ThirdParty-2f-SEGGER-2f-OS:
	-$(RM) ./ThirdParty/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.d ./ThirdParty/SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.o

.PHONY: clean-ThirdParty-2f-SEGGER-2f-OS

