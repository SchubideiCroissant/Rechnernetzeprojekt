################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Drivers/wifi_module.cpp \
../Drivers/wifi_wrapper.cpp 

OBJS += \
./Drivers/wifi_module.o \
./Drivers/wifi_wrapper.o 

CPP_DEPS += \
./Drivers/wifi_module.d \
./Drivers/wifi_wrapper.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/%.o Drivers/%.su Drivers/%.cyclo: ../Drivers/%.cpp Drivers/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -c -I../Core/Inc -I../User -I../Drivers/BSP/B-L475E-IOT01/ -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers

clean-Drivers:
	-$(RM) ./Drivers/wifi_module.cyclo ./Drivers/wifi_module.d ./Drivers/wifi_module.o ./Drivers/wifi_module.su ./Drivers/wifi_wrapper.cyclo ./Drivers/wifi_wrapper.d ./Drivers/wifi_wrapper.o ./Drivers/wifi_wrapper.su

.PHONY: clean-Drivers

