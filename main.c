#define STM32F103xB
#include "stm32f1xx.h"

void delay(volatile uint32_t count) {
    while(count--);
}

int main(void) {
    // Enable GPIOC clock
    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
    
    // Configure PC13 as output
    GPIOC->CRH = (GPIOC->CRH & ~0xFF000000) | 0x33000000;
    
    while(1) {
        GPIOC->ODR ^= (1 << 13);  // Toggle
        delay(2000000);
    }
}
