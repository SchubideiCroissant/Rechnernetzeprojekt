################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/S2868A1/s2868a1.c 

C_DEPS += \
./Drivers/BSP/S2868A1/s2868a1.d 

OBJS += \
./Drivers/BSP/S2868A1/s2868a1.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/S2868A1/%.o Drivers/BSP/S2868A1/%.su Drivers/BSP/S2868A1/%.cyclo: ../Drivers/BSP/S2868A1/%.c Drivers/BSP/S2868A1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -c -I../Core/Inc -I../Drivers/BSP/B-L475E-IOT01 -I../Drivers/BSP/Components/ism43362 -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-S2868A1

clean-Drivers-2f-BSP-2f-S2868A1:
	-$(RM) ./Drivers/BSP/S2868A1/s2868a1.cyclo ./Drivers/BSP/S2868A1/s2868a1.d ./Drivers/BSP/S2868A1/s2868a1.o ./Drivers/BSP/S2868A1/s2868a1.su

.PHONY: clean-Drivers-2f-BSP-2f-S2868A1

