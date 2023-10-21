#include <bflb_platform.h>
#include <hal_gpio.h>
#include <usb_stdio.h>
#include "io_def.h"

int main(void)
{
    gpio_set_mode(LED_B_PIN, GPIO_OUTPUT_PP_MODE);
    gpio_set_mode(LED_G_PIN, GPIO_OUTPUT_PP_MODE);
    gpio_set_mode(LED_R_PIN, GPIO_OUTPUT_PP_MODE);

    printf("[main] start loop\r\n");

    gpio_write(LED_B_PIN, 0);
    gpio_write(LED_G_PIN, 0);
    gpio_write(LED_R_PIN, 0);
}
