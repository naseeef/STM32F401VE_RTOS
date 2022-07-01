################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThridParty/SEGGER/SEGGER/SEGGER_RTT.c \
../ThridParty/SEGGER/SEGGER/SEGGER_RTT_printf.c \
../ThridParty/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../ThridParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./ThridParty/SEGGER/SEGGER/SEGGER_RTT.o \
./ThridParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./ThridParty/SEGGER/SEGGER/SEGGER_RTT_printf.o \
./ThridParty/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./ThridParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./ThridParty/SEGGER/SEGGER/SEGGER_RTT.d \
./ThridParty/SEGGER/SEGGER/SEGGER_RTT_printf.d \
./ThridParty/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
ThridParty/SEGGER/SEGGER/%.o: ../ThridParty/SEGGER/SEGGER/%.c ThridParty/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.06 - LED4-TASK_NOTIFY_INTERRUPT/ThridParty/FreeRTOS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.06 - LED4-TASK_NOTIFY_INTERRUPT/ThridParty/FreeRTOS/include" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.06 - LED4-TASK_NOTIFY_INTERRUPT/ThridParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.06 - LED4-TASK_NOTIFY_INTERRUPT/ThridParty/SEGGER/SEGGER" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.06 - LED4-TASK_NOTIFY_INTERRUPT/ThridParty/SEGGER/OS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.06 - LED4-TASK_NOTIFY_INTERRUPT/ThridParty/SEGGER/Config" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
ThridParty/SEGGER/SEGGER/%.o: ../ThridParty/SEGGER/SEGGER/%.S ThridParty/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.03 - LED/ThridParty/SEGGER/Config" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.03 - LED/ThridParty/SEGGER/SEGGER" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-ThridParty-2f-SEGGER-2f-SEGGER

clean-ThridParty-2f-SEGGER-2f-SEGGER:
	-$(RM) ./ThridParty/SEGGER/SEGGER/SEGGER_RTT.d ./ThridParty/SEGGER/SEGGER/SEGGER_RTT.o ./ThridParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./ThridParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./ThridParty/SEGGER/SEGGER/SEGGER_RTT_printf.d ./ThridParty/SEGGER/SEGGER/SEGGER_RTT_printf.o ./ThridParty/SEGGER/SEGGER/SEGGER_SYSVIEW.d ./ThridParty/SEGGER/SEGGER/SEGGER_SYSVIEW.o

.PHONY: clean-ThridParty-2f-SEGGER-2f-SEGGER

