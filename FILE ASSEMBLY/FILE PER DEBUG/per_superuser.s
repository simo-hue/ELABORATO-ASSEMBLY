.section .data
clear_screen:
    .ascii "\033[2J"

.section .text
.global _start

_start:
    ; Pulizia dello schermo
    mov $4, %eax
    mov $1, %ebx
    mov $clear_screen, %ecx
    mov $6, %edx 
    int $0x80
