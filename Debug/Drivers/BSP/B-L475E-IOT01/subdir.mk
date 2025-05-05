################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Drivers/BSP/B-L475E-IOT01/wifi_module.cpp \
../Drivers/BSP/B-L475E-IOT01/wifi_wrapper.cpp 

OBJS += \
./Drivers/BSP/B-L475E-IOT01/wifi_module.o \
./Drivers/BSP/B-L475E-IOT01/wifi_wrapper.o 

CPP_DEPS += \
./Drivers/BSP/B-L475E-IOT01/wifi_module.d \
./Drivers/BSP/B-L475E-IOT01/wifi_wrapper.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/B-L475E-IOT01/%.o Drivers/BSP/B-L475E-IOT01/%.su Drivers/BSP/B-L475E-IOT01/%.cyclo: ../Drivers/BSP/B-L475E-IOT01/%.cpp Drivers/BSP/B-L475E-IOT01/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -c -I../Core/Inc -I../Drivers/BSP/B-L475E-IOT01/ -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../X-CUBE-SUBG2/Target -I../Drivers/BSP/S2868A1 -I../Drivers/BSP/Components/S2LP -I../Drivers/BSP/Components/S2LP/S2LP_Library/inc -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-B-2d-L475E-2d-IOT01

clean-Drivers-2f-BSP-2f-B-2d-L475E-2d-IOT01:
	-$(RM) ./Drivers/BSP/B-L475E-IOT01/wifi_module.cyclo ./Drivers/BSP/B-L475E-IOT01/wifi_module.d ./Drivers/BSP/B-L475E-IOT01/wifi_module.o ./Drivers/BSP/B-L475E-IOT01/wifi_module.su ./Drivers/BSP/B-L475E-IOT01/wifi_wrapper.cyclo ./Drivers/BSP/B-L475E-IOT01/wifi_wrapper.d ./Drivers/BSP/B-L475E-IOT01/wifi_wrapper.o ./Drivers/BSP/B-L475E-IOT01/wifi_wrapper.su

.PHONY: clean-Drivers-2f-BSP-2f-B-2d-L475E-2d-IOT01

