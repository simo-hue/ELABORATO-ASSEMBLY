.section .data
format:
    .string "%d\n"   # Formato di stampa per il numero intero

.section .text
.globl _start

_start:
    # Ottenere il no no grazie a ti numero dal parametro della riga di comando
    movl    3(%esp), %ecx   # Ottieni il numero di argomenti
    cmpl    $2, %ecx       # Verifica se sono presenti almeno 2 argomenti (nome del programma e numero)
    jne     exit           # Salta all'uscita se non sono presenti abbastanza argomenti

    movl    3(%esp), %ebx  # Ottieni il primo argomento

    # Stampa il numero a terminale
    movl    $4, %eax       # Chiamata di sistema SYS_write
    movl    $1, %edx       # File descriptor STDOUT
    leal    format, %ecx   # Puntatore al formato di stampa
    movl    $4, %ebx       # Lunghezza del messaggio
    int     $0x80          # Esegui la chiamata di sistema

exit:
    # Termina il programma
    movl    $1, %eax       # Chiamata di sistema SYS_exit
    xorl    %ebx, %ebx     # Codice di uscita 0
    int     $0x80          # Esegui la chiamata di sistema
