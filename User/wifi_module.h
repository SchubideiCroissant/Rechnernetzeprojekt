#include "wifi_wrapper.h"
#include "wifi_module.h"
#include "stm32l4xx_hal.h"

static WiFiModule* wifiInstance = nullptr;

extern UART_HandleTypeDef huart1;

void WiFiWrapper_Init(SPI_HandleTypeDef *hspi, GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin) {
    static WiFiModule staticInstance(hspi, GPIOx, GPIO_Pin);
    wifiInstance = &staticInstance;
    wifiInstance->init();
}

bool WiFiWrapper_Connect(const char *ssid, const char *password) {
    if (!wifiInstance) return false;
    return wifiInstance->connect(ssid, password);
}

bool WiFiWrapper_OpenSocket(const char *host, uint16_t port) {
    if (!wifiInstance) return false;
    return wifiInstance->openTCPSocket(host, port);
}

bool WiFiWrapper_Send(const uint8_t *data, size_t len) {
    if (!wifiInstance) return false;
    return wifiInstance->sendData(data, len);
}

int WiFiWrapper_Receive(uint8_t *buffer, size_t max_len) {
    if (!wifiInstance) return -1;
    return wifiInstance->receiveData(buffer, max_len);
}

bool WiFiWrapper_SendCommand(const char* cmd, uint32_t timeout) {
    if (!wifiInstance) return false;
    return wifiInstance->sendCommand(cmd, timeout);
}

int WiFiWrapper_ReadData(uint8_t* buffer, size_t buffer_len, uint32_t timeout) {
    if (!wifiInstance) return -1;
    return wifiInstance->readData(buffer, buffer_len, timeout);
}

bool WiFiWrapper_FetchPrompt(uint32_t timeout) {
    if (!wifiInstance) return false;
    return wifiInstance->fetchPrompt(timeout);
}
