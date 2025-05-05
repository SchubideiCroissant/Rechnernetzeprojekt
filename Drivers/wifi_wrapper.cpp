#include "wifi_module.h"
#include "stm32l4xx_hal.h"

extern "C" {
    #include "wifi_wrapper.h"

    extern SPI_HandleTypeDef hspi3;

    static WiFiModule wifi(&hspi3, GPIOE, GPIO_PIN_0);

    bool wifi_init(void) {
        return wifi.init();
    }

    bool wifi_connect(const char* ssid, const char* password) {
        return wifi.connect(ssid, password);
    }

    int wifi_read_data(uint8_t* buffer, size_t buffer_len, uint32_t timeout) {
        return wifi.readData(buffer, buffer_len, timeout);
    }

    bool wifi_send_command(const char* cmd, uint32_t timeout) {
        return wifi.sendCommand(cmd, timeout);
    }
}
