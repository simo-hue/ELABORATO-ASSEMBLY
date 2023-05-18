.section .data
    message_normal: .ascii "ciao sei un utente normale\n"
    message_superuser: .ascii "ciao superuser\n"

.section .text
    .global _start

_start:
    # Controllo se sono stati passati argomenti da riga di comando
    cmpl $1, (%esp)          # Controllo se il conteggio degli argomenti è uguale a 1
    jne normal_user         # Se il conteggio non è uguale a 1, vai alla sezione per l'utente normale
    
    # Se è stato passato un argomento, convertiamo il valore in un intero
    movl 4(%esp), %ebx      # Puntatore al primo argomento
    pushl %ebx              # Push del puntatore all'argomento per prepararlo per la funzione atoi
    call atoi               # Chiamata alla funzione atoi
    addl $4, %esp           # Rimozione del puntatore all'argomento dalla stack

    # Controlliamo il valore convertito
    cmpl $2244, %eax        # Controllo se il valore convertito è uguale a 2244
    jne normal_user         # Se il valore convertito non è uguale a 2244, vai alla sezione per l'utente normale
    
    # Se il controllo precedente fallisce, stampa "ciao superuser"
    movl $message_superuser, %edx
    movl $15, %ecx           # Lunghezza del messaggio "ciao superuser\n"
    jmp print_message

normal_user:
    # Se il controllo precedente fallisce o non ci sono argomenti, stampa "ciao sei un utente normale"
    movl $message_normal, %edx
    movl $23, %ecx           # Lunghezza del messaggio "ciao sei un utente normale\n"

print_message:
    # Stampa il messaggio
    movl $1, %eax           # File descriptor (1 per stdout)
    movl %edx, %ebx         # Puntatore al messaggio
    movl $23, %edx          # Lunghezza del messaggio
    movl $4, %eax           # Chiamata di sistema per scrivere
    int $0x80               # Interruzione del kernel per eseguire la chiamata di sistema

exit:
    # Termina il programma
    movl $1, %eax           # Chiamata di sistema per terminare il programma
    xorl %ebx, %ebx         # Codice di uscita (0)
    int $0x80               # Interruzione del kernel per eseguire la chiamata di sistema exit

# Definizione della funzione atoi per la conversione del parametro
.section .text
atoi:
    pushl %ebp              # Salva il frame pointer attuale
    movl %esp, %ebp         # Imposta il nuovo frame pointer

    xorl %eax, %eax         # Inizializza il valore convertito a 0
    movl 8(%ebp), %ecx      # Puntatore alla stringa da convertire

    movb (%ecx), %dl        # Carica il primo carattere della stringa
    test %dl, %dl           # Controlla se è raggiunto il terminatore di stringa
    je atoi_done            # Se il carattere è 0, termina la conversione

    movl $0, %eax           # Inizializza il valore convertito a 0

atoi_loop:
    imull $10, %eax         # Moltiplica il valore convertito per 10
    subb $48, %dl           # Sottrae il valore ASCII '0' per ottenere il valore numerico del carattere
    addl %edx, %eax         # Aggiunge il valore numerico al valore convertito

    inc %ecx                # Passa al carattere successivo
    movb (%ecx), %dl        # Carica il carattere corrente
    test %dl, %dl           # Controlla se è raggiunto il terminatore di stringa
    jne atoi_loop           # Se il carattere non è 0, ripete il loop

atoi_done:
    popl %ebp               # Ripristina il frame pointer originale
    ret                     # Ritorna al chiamante
