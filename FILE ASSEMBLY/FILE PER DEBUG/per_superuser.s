section .data
    message_normal db 'ciao sei un utente normale', 0
    message_superuser db 'ciao superuser', 0
    message_ptr db 0

section .text
    global _start

_start:
    ; Controllo se sono stati passati argomenti da riga di comando
    cmp dword [esp+4], 1       ; Controllo se il conteggio degli argomenti è uguale a 1
    jne normal_user            ; Se il conteggio non è uguale a 1, vai alla sezione per l'utente normale
    
    ; Se è stato passato un argomento, controlliamo il suo valore
    cmp dword [esp+8], 2244    ; Controllo se il primo argomento è uguale a 2244
    jne normal_user            ; Se il primo argomento non è uguale a 2244, vai alla sezione per l'utente normale
    
    ; Se il controllo precedente fallisce, stampa "ciao superuser"
    mov eax, message_superuser
    jmp print_message

normal_user:
    ; Se il controllo precedente fallisce o non ci sono argomenti, stampa "ciao sei un utente normale"
    mov eax, message_normal

print_message:
    ; Stampa il messaggio
    mov ebx, 1                  ; File descriptor (1 per stdout)
    mov ecx, eax                ; Puntatore al messaggio
    mov edx, 22                 ; Lunghezza del messaggio
    mov eax, 4                  ; Chiamata di sistema per scrivere
    int 0x80                    ; Interruzione del kernel per eseguire la chiamata di sistema

exit:
    ; Termina il programma
    mov eax, 1                  ; Chiamata di sistema per terminare il programma
    xor ebx, ebx                ; Codice di uscita (0)
    int 0x80                    ; Interruzione del kernel per eseguire la chiamata di sistema
