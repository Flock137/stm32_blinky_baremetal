CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m3 -mthumb -DSTM32F103xB -O0 -g -Wall -ffreestanding
LDFLAGS = -T stm32f103c8t6.ld -nostartfiles -lc -lnosys

all: main.elf

main.elf: main.o
	$(CC) $(LDFLAGS) main.o -o main.elf

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

clean:
	rm -f *.o *.elf

qemu: main.elf
	qemu-system-arm -machine stm32vldiscovery -cpu cortex-m3 -kernel main.elf -nographic

.PHONY: all clean qemu
