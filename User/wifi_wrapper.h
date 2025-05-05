#ifndef WIFI_WRAPPER_H
#define WIFI_WRAPPER_H
#include <stdbool.h>
#include <stdint.h> // für uint8_t, uint32_t
#include <stddef.h> // für size_t
#ifdef __cplusplus
extern "C" {
#endif

bool wifi_init(void);
bool wifi_connect(const char* ssid, const char* password);
int wifi_read_data(uint8_t* buffer, size_t buffer_len, uint32_t timeout);
bool wifi_send_command(const char* cmd, uint32_t timeout);

#ifdef __cplusplus
}
#endif

#endif // WIFI_WRAPPER_H
