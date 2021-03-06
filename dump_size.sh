#!/bin/bash

dump_size(){
    arm-none-eabi-size --format=sysv $1 > $2
    arm-none-eabi-nm --print-size --size-sort --reverse-sort --radix=d $1 | grep -E " (t|T) " | grep -vE "(HAL_|ili9341|tft|LTDC|I2C|DMA|FMC|SysTick|stm|BSP|dma|atexit|IOE|LCD|__libc|_sbr|System|SPI|__retarget|Default_Handler|free)" | cut -d" " -f2,4 | sort -k2 >> $2
    arm-none-eabi-nm --print-size --size-sort --reverse-sort --radix=d $1 | grep -E " (t|T) " | grep -vE "(HAL_|ili9341|tft|LTDC|I2C|DMA|FMC|SysTick|stm|BSP|dma|atexit|IOE|LCD|__libc|_sbr|System|SPI|__retarget|Default_Handler|free)" | cut -d" " -f2,4 > $3
    arm-none-eabi-nm --print-size --size-sort --reverse-sort --radix=d $1 | grep -E " (t|T) " | cut -d" " -f2,4 > $4
    cp $1 $5
}

dump_size lv_port_stm32f429_disco_v6/Debug/*elf v6_function.txt v6_function_size_sort.txt v6_function_size_sort_without_grep.txt v6.elf
dump_size lv_port_stm32f429_disco_v7/Debug/*elf v7_function.txt v7_function_size_sort.txt v7_function_size_sort_without_grep.txt v7.elf

