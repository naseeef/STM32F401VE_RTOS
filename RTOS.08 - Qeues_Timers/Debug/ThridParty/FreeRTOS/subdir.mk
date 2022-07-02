################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThridParty/FreeRTOS/croutine.c \
../ThridParty/FreeRTOS/event_groups.c \
../ThridParty/FreeRTOS/list.c \
../ThridParty/FreeRTOS/queue.c \
../ThridParty/FreeRTOS/stream_buffer.c \
../ThridParty/FreeRTOS/tasks.c \
../ThridParty/FreeRTOS/timers.c 

OBJS += \
./ThridParty/FreeRTOS/croutine.o \
./ThridParty/FreeRTOS/event_groups.o \
./ThridParty/FreeRTOS/list.o \
./ThridParty/FreeRTOS/queue.o \
./ThridParty/FreeRTOS/stream_buffer.o \
./ThridParty/FreeRTOS/tasks.o \
./ThridParty/FreeRTOS/timers.o 

C_DEPS += \
./ThridParty/FreeRTOS/croutine.d \
./ThridParty/FreeRTOS/event_groups.d \
./ThridParty/FreeRTOS/list.d \
./ThridParty/FreeRTOS/queue.d \
./ThridParty/FreeRTOS/stream_buffer.d \
./ThridParty/FreeRTOS/tasks.d \
./ThridParty/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
ThridParty/FreeRTOS/%.o: ../ThridParty/FreeRTOS/%.c ThridParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.08 - Qeues_Timers/ThridParty/FreeRTOS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.08 - Qeues_Timers/ThridParty/FreeRTOS/include" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.08 - Qeues_Timers/ThridParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.08 - Qeues_Timers/ThridParty/SEGGER/SEGGER" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.08 - Qeues_Timers/ThridParty/SEGGER/OS" -I"C:/Users/Naseef/Documents/STM32CubeIDE/RTOS.08 - Qeues_Timers/ThridParty/SEGGER/Config" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-ThridParty-2f-FreeRTOS

clean-ThridParty-2f-FreeRTOS:
	-$(RM) ./ThridParty/FreeRTOS/croutine.d ./ThridParty/FreeRTOS/croutine.o ./ThridParty/FreeRTOS/event_groups.d ./ThridParty/FreeRTOS/event_groups.o ./ThridParty/FreeRTOS/list.d ./ThridParty/FreeRTOS/list.o ./ThridParty/FreeRTOS/queue.d ./ThridParty/FreeRTOS/queue.o ./ThridParty/FreeRTOS/stream_buffer.d ./ThridParty/FreeRTOS/stream_buffer.o ./ThridParty/FreeRTOS/tasks.d ./ThridParty/FreeRTOS/tasks.o ./ThridParty/FreeRTOS/timers.d ./ThridParty/FreeRTOS/timers.o

.PHONY: clean-ThridParty-2f-FreeRTOS

