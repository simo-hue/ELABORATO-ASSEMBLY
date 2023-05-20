.section .data

.section .text
.globl _start
_start:
    movl 4(%esp), %ecx         # Move the address of the command-line argument into ECX
    movl (%ecx), %eax          # Move the value of the argument into EAX
    subl $4, %esp              # Allocate space on the stack for a temporary buffer
    movl %eax, (%esp)          # Move the value of the number into the buffer
    call printNumber           # Call the function to print the number
    addl $4, %esp              # Adjust the stack pointer after using the buffer
    call exit                  # Call the exit function

printNumber:
    movl 4(%esp), %ecx         # Move the address of the number on the stack into ECX

    movl $4, %eax              # Syscall 4: write
    movl $1, %ebx              # File descriptor: stdout
    movl %ecx, %edx            # Length of the string: 4 (to print the 4-digit number)
    int $0x80                  # Execute the syscall

    ret

exit:
    movl $1, %eax              # Syscall 1: exit
    xorl %ebx, %ebx            # Exit code: 0
    int $0x80                  # Execute the syscall
