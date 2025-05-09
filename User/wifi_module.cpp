#include <cstdio>    // für snprintf, printf usw.
#include <cstring>   // für strcpy, strcmp usw.
#include "wifi_module.h"
#include "stm32l4xx_hal.h" // für HAL Funktionen
extern UART_HandleTypeDef huart1;


WiFiModule::WiFiModule(SPI_HandleTypeDef *hspi, GPIO_TypeDef* CS_GPIO_Port, uint16_t CS_Pin)
    : m_hspi(hspi), m_CS_GPIO_Port(CS_GPIO_Port), m_CS_Pin(CS_Pin) {}

bool WiFiModule::init() {
    char response[128];
    char response_buffer[128];
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_8, GPIO_PIN_SET); // Wakeup aktiv
    HAL_Delay(50);
    const char* msg1 = "Calling fetchPrompt...\r\n";
    HAL_UART_Transmit(&huart1, (uint8_t*)msg1, strlen(msg1), HAL_MAX_DELAY);

    if (!fetchPrompt(1000))
        {
            printf("Prompt Fetch Failed!\r\n");
            return false;
        }

    return true;


}
void WiFiModule::select() {
    HAL_GPIO_WritePin(m_CS_GPIO_Port, m_CS_Pin, GPIO_PIN_RESET);
}

void WiFiModule::deselect() {
    HAL_GPIO_WritePin(m_CS_GPIO_Port, m_CS_Pin, GPIO_PIN_SET);
}

bool WiFiModule::sendCommand(const char* cmd, uint32_t timeout)
{
    HAL_StatusTypeDef result;

    char cmd_buffer[128];
    strncpy(cmd_buffer, cmd, sizeof(cmd_buffer) - 1);
    size_t len = strlen(cmd_buffer);

    // Padding auf gerade Länge
    if (len % 2 != 0 && len < sizeof(cmd_buffer) - 1)
    {
        cmd_buffer[len++] = 0x0A; // 0x0A (LF) ergänzen
    }

    uint32_t start_tick = HAL_GetTick();
    while (HAL_GPIO_ReadPin(GPIOE, GPIO_PIN_1) == 0)
    {
        if ((HAL_GetTick() - start_tick) > timeout)
        {
            printf("Timeout waiting for CMD/DATA READY before sending.\r\n");
            return false;
        }
    }

    // --- Kommando 16-bit senden ---
    select();

    for (size_t i = 0; i < len; i += 2)
    {
        uint16_t word = (uint16_t)(((uint8_t)cmd_buffer[i+1] << 8) | (uint8_t)cmd_buffer[i]);
        result = HAL_SPI_Transmit(m_hspi, (uint8_t*)&word, 1, timeout);
        if (result != HAL_OK)
        {
            deselect();
            printf("SPI Transmit Error during sendCommand.\r\n");
            return false;
        }
    }

    deselect();

    // --- Warten bis Command abgeschlossen ---
    start_tick = HAL_GetTick();
    while (HAL_GPIO_ReadPin(GPIOE, GPIO_PIN_1) == GPIO_PIN_RESET)
    {
        if ((HAL_GetTick() - start_tick) > timeout)
        {
            printf("Timeout waiting for CMD/DATA READY after command phase.\r\n");
            return false;
        }
    }

    return true;
}

int WiFiModule::readData(uint8_t* buffer, size_t buffer_len, uint32_t timeout)
{
    HAL_StatusTypeDef result;
    uint32_t start_tick = HAL_GetTick();
    size_t received = 0;
    uint8_t dummy_tx[2] = {0x0A, 0x0A};

    select();
    while ((HAL_GetTick() - start_tick) < timeout && received < (buffer_len - 2))
    {
        if (HAL_GPIO_ReadPin(GPIOE, GPIO_PIN_1) == GPIO_PIN_RESET)
        {
            // Keine Daten mehr verfügbar
            break;
        }

        uint8_t rx_buf[2] = {0};
        result = HAL_SPI_TransmitReceive(m_hspi, dummy_tx, rx_buf, 2, 10);

        if (result == HAL_OK)
        {
            if (received < buffer_len - 2) buffer[received++] = rx_buf[0];
            if (received < buffer_len - 1) buffer[received++] = rx_buf[1];
        }
        else
        {
            HAL_Delay(1);
        }
    }
    deselect();

    // Padding 0x15 am Ende entfernen
    while (received > 0 && buffer[received - 1] == 0x15) {
        received--;
    }

    // Nur Nullterminator setzen, wenn noch Platz im Buffer ist
    if (received < buffer_len) {
        buffer[received] = '\0';
    }

    printf("Data received (%d bytes)\r\n", (int)received);
    return (int)received;
}





bool WiFiModule::fetchPrompt(uint32_t timeout)
{
    uint8_t tx_buf[2] = {0x0A, 0x0A}; // Dummy 0x0A0A senden
    uint8_t rx_buf[2] = {0};
    uint8_t response[128] = {0}; // Lokaler Buffer für den empfangenen Prompt
    size_t received = 0;
    uint32_t start_tick = HAL_GetTick();

    select(); // SSN aktiv LOW

    while ((HAL_GetTick() - start_tick) < timeout)
    {
        if (HAL_GPIO_ReadPin(GPIOE, GPIO_PIN_1) == GPIO_PIN_RESET)
        {
            // Prompt vollständig empfangen
            break;
        }

        HAL_StatusTypeDef result = HAL_SPI_TransmitReceive(m_hspi, tx_buf, rx_buf, 2, 10);

        if (result == HAL_OK)
        {
            if (received < sizeof(response) - 2) response[received++] = rx_buf[0];
            if (received < sizeof(response) - 1) response[received++] = rx_buf[1];
        }
        else
        {
            HAL_Delay(1); // Bei Kommunikationsfehlern kurz warten
        }
    }

    deselect(); // SSN wieder HIGH

    if (received > 0 && received < sizeof(response))
        response[received] = '\0'; // Abschluss Nullterminator setzen

    printf("Prompt received (%d bytes): %s\r\n", (int)received, response);

    return (received > 0); // Erfolg: Mindestens ein Byte empfangen
}


/*
bool WiFiModule::connect(const char *ssid, const char *password) {
    char cmd[256], response[256];
    snprintf(cmd, sizeof(cmd), "AT+S.SSIDTXT=%s\r\n", ssid);
    if (!sendCommand(cmd, response, sizeof(response), 2000)) return false;

    snprintf(cmd, sizeof(cmd), "AT+S.SCFG=wifi_wpa_psk_text,%s\r\n", password);
    if (!sendCommand(cmd, response, sizeof(response), 2000)) return false;

    return sendCommand("AT&W\r\n", response, sizeof(response), 1000);
}

bool WiFiModule::openTCPSocket(const char *host, uint16_t port) {
    char cmd[256], response[256];
    snprintf(cmd, sizeof(cmd), "AT+S.SOCKON=%s,%d,t\r\n", host, port);
    return sendCommand(cmd, response, sizeof(response), 3000);
}

bool WiFiModule::sendData(const uint8_t *data, size_t len) {
    char cmd[64], response[128];
    snprintf(cmd, sizeof(cmd), "AT+S.SOCKW=00,%d\r\n", (int)len);
    if (!sendCommand(cmd, response, sizeof(response), 1000)) return false;

    select();
    HAL_SPI_Transmit(m_hspi, (uint8_t*)data, len, 2000);
    deselect();

    return true;
}

int WiFiModule::receiveData(uint8_t *buffer, size_t max_len) {
    select();
    int len = HAL_SPI_Receive(m_hspi, buffer, max_len, 2000);
    deselect();
    return len;
}

*/


