.section .data

.section .text

.global _start

_start:
    call stampaCodiceUser
    call exit

stampaCodiceUser:
    movl 12(%esp), %ecx        # Move the address of the second argument into ECX
    movl (%ecx), %esi          # Move the value of the second argument into ESI
    movl $4, %eax              # Syscall 4: write
    movl $1, %ebx              # File descriptor: stdout
    movl $4, %edx              # Length of the string: 4 (to print the argument as a 32-bit integer)
    int $0x80                  # Execute the syscall

    ret

exit:
    movl $1, %eax              # Syscall 1: exit
    xorl %ebx, %ebx            # Exit code: 0
    int $0x80                  # Execute the syscall
