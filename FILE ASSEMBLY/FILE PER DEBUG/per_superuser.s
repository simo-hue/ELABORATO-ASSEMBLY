.section .data
    message_normal: .string "ciao sei un utente normale"
    message_superuser: .string "ciao superuser"
    message_ptr: .long 0

.section .text
    .global _start

_start:
    # Controllo se sono stati passati argomenti da riga di comando
    movl 4(%esp), %eax       # Carica il conteggio degli argomenti nella register eax
    cmpl $1, %eax            # Controllo se il conteggio degli argomenti è uguale a 1
    jne normal_user          # Se il conteggio non è uguale a 1, vai alla sezione per l'utente normale
    
    # Se è stato passato un argomento, controlliamo il suo valore
    cmpl $2244, 8(%esp)      # Controllo se il primo argomento è uguale a 2244
    jne normal_user          # Se il primo argomento non è uguale a 2244, vai alla sezione per l'utente normale
    
    # Se il controllo precedente fallisce, stampa "ciao superuser"
    movl $message_superuser, %eax
    jmp print_message

normal_user:
    # Se il controllo precedente fallisce o non ci sono argomenti, stampa "ciao sei un utente normale"
    movl $message_normal, %eax

print_message:
    # Stampa il messaggio
    movl $1, %ebx           # File descriptor (1 per stdout)
    movl %eax, %ecx         # Puntatore al messaggio
    movl $22, %edx          # Lunghezza del messaggio
    movl $4, %eax           # Chiamata di sistema per scrivere
    int $0x80               # Interruzione del kernel per eseguire la chiamata di sistema

exit:
    # Termina il programma
    movl $1, %eax           # Chiamata di sistema per terminare il programma
    xorl %ebx, %ebx         # Codice di uscita (0)
    int $0x80               # Interruzione del kernel per eseguire la chiamata di sistema
