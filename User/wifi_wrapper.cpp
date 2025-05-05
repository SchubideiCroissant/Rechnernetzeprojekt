#ifndef WIFI_WRAPPER_H
#define WIFI_WRAPPER_H

#include "wifi_module.h"

#ifdef __cplusplus
extern "C" {
#endif

void WiFiWrapper_Init(SPI_HandleTypeDef *hspi, GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
bool WiFiWrapper_Connect(const char *ssid, const char *password);
bool WiFiWrapper_OpenSocket(const char *host, uint16_t port);
bool WiFiWrapper_Send(const uint8_t *data, size_t len);
int WiFiWrapper_Receive(uint8_t *buffer, size_t max_len);

#ifdef __cplusplus
}
#endif

#endif // WIFI_WRAPPER_H
