#ifndef WIFI_MODULE_H
#define WIFI_MODULE_H

#include "stm32l4xx_hal.h"

class WiFiModule {
public:
    WiFiModule(SPI_HandleTypeDef *hspi, GPIO_TypeDef* CS_GPIO_Port, uint16_t CS_Pin);

    bool init();
    bool connect(const char *ssid, const char *password);
    bool openTCPSocket(const char *host, uint16_t port);
    bool sendData(const uint8_t *data, size_t len);
    int receiveData(uint8_t *buffer, size_t max_len);
    bool fetchPrompt(uint32_t timeout);
    int readData(uint8_t* buffer, size_t buffer_len, uint32_t timeout);
    bool sendCommand(const char* cmd, uint32_t timeout);

private:
    SPI_HandleTypeDef *m_hspi;
    GPIO_TypeDef* m_CS_GPIO_Port;
    uint16_t m_CS_Pin;

    void select();
    void deselect();

};

#endif // WIFI_MODULE_H
