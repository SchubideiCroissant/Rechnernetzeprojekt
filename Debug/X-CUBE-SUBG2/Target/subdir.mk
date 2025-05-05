################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../X-CUBE-SUBG2/Target/s2lp_management.c 

C_DEPS += \
./X-CUBE-SUBG2/Target/s2lp_management.d 

OBJS += \
./X-CUBE-SUBG2/Target/s2lp_management.o 


# Each subdirectory must supply rules for building sources it contributes
X-CUBE-SUBG2/Target/%.o X-CUBE-SUBG2/Target/%.su X-CUBE-SUBG2/Target/%.cyclo: ../X-CUBE-SUBG2/Target/%.c X-CUBE-SUBG2/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -c -I../Core/Inc -I../Drivers/BSP/B-L475E-IOT01 -I../Drivers/BSP/B-L475E-IOT01/Components/ism43362 -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../X-CUBE-SUBG2/Target -I../Drivers/BSP/S2868A1 -I../Drivers/BSP/Components/S2LP -I../Drivers/BSP/Components/S2LP/S2LP_Library/inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-X-2d-CUBE-2d-SUBG2-2f-Target

clean-X-2d-CUBE-2d-SUBG2-2f-Target:
	-$(RM) ./X-CUBE-SUBG2/Target/s2lp_management.cyclo ./X-CUBE-SUBG2/Target/s2lp_management.d ./X-CUBE-SUBG2/Target/s2lp_management.o ./X-CUBE-SUBG2/Target/s2lp_management.su

.PHONY: clean-X-2d-CUBE-2d-SUBG2-2f-Target

