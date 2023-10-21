#include <bflb_platform.h>
#include <hal_gpio.h>
#include <usb_stdio.h>
#include "io_def.h"

int main()
{
    bflb_platform_init(0);
    usb_stdio_init();

    gpio_set_mode(LED_B_PIN, GPIO_OUTPUT_PP_MODE);
    gpio_set_mode(LED_G_PIN, GPIO_OUTPUT_PP_MODE);
    gpio_set_mode(LED_R_PIN, GPIO_OUTPUT_PP_MODE);

    while (1) {
        printf("hello, world\r\n");
        gpio_write(LED_B_PIN, 0);
        gpio_write(LED_G_PIN, 0);
        gpio_write(LED_R_PIN, 0);
        mtimer_delay_ms(50);
        gpio_write(LED_B_PIN, 1);
        gpio_write(LED_G_PIN, 1);
        gpio_write(LED_R_PIN, 1);
        mtimer_delay_ms(2000);
    }
}