################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/B-L475E-IOT01/depricated/es_wifi.c \
../Drivers/BSP/B-L475E-IOT01/depricated/spi_wifi.c \
../Drivers/BSP/B-L475E-IOT01/depricated/wifi.c 

C_DEPS += \
./Drivers/BSP/B-L475E-IOT01/depricated/es_wifi.d \
./Drivers/BSP/B-L475E-IOT01/depricated/spi_wifi.d \
./Drivers/BSP/B-L475E-IOT01/depricated/wifi.d 

OBJS += \
./Drivers/BSP/B-L475E-IOT01/depricated/es_wifi.o \
./Drivers/BSP/B-L475E-IOT01/depricated/spi_wifi.o \
./Drivers/BSP/B-L475E-IOT01/depricated/wifi.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/B-L475E-IOT01/depricated/%.o Drivers/BSP/B-L475E-IOT01/depricated/%.su Drivers/BSP/B-L475E-IOT01/depricated/%.cyclo: ../Drivers/BSP/B-L475E-IOT01/depricated/%.c Drivers/BSP/B-L475E-IOT01/depricated/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -c -I../Core/Inc -I../Drivers/BSP/B-L475E-IOT01 -I../Drivers/BSP/Components/ism43362 -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-B-2d-L475E-2d-IOT01-2f-depricated

clean-Drivers-2f-BSP-2f-B-2d-L475E-2d-IOT01-2f-depricated:
	-$(RM) ./Drivers/BSP/B-L475E-IOT01/depricated/es_wifi.cyclo ./Drivers/BSP/B-L475E-IOT01/depricated/es_wifi.d ./Drivers/BSP/B-L475E-IOT01/depricated/es_wifi.o ./Drivers/BSP/B-L475E-IOT01/depricated/es_wifi.su ./Drivers/BSP/B-L475E-IOT01/depricated/spi_wifi.cyclo ./Drivers/BSP/B-L475E-IOT01/depricated/spi_wifi.d ./Drivers/BSP/B-L475E-IOT01/depricated/spi_wifi.o ./Drivers/BSP/B-L475E-IOT01/depricated/spi_wifi.su ./Drivers/BSP/B-L475E-IOT01/depricated/wifi.cyclo ./Drivers/BSP/B-L475E-IOT01/depricated/wifi.d ./Drivers/BSP/B-L475E-IOT01/depricated/wifi.o ./Drivers/BSP/B-L475E-IOT01/depricated/wifi.su

.PHONY: clean-Drivers-2f-BSP-2f-B-2d-L475E-2d-IOT01-2f-depricated

