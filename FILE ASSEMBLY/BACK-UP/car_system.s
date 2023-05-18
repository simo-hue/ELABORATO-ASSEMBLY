.section .data

clear_screen:
    .ascii "\033[2J"

tastiera:
    .space 3

acapo:
    .ascii "\n"
acapo_len:
    .long . - acapo

pos_freccia:
    .long 0

stato_porte:
    .long 0

stato_back:
    .long 0

sett_auto:
    .ascii "Setting automobile:\n\n"

sett_auto_len:
    
    .long . - sett_auto

data:
    .ascii "1. Data: 18/05/2023\n"
data_len:
    .long . - data

ora:
    .ascii "2. Ora: 15:15\n"
ora_len:
    .long . - ora

blocco_porte:
    .ascii "3. Blocco Automatico Porte: "
    
blocco_porte_len:
    .long . - blocco_porte

back_home:
    .ascii "4. Back-Home: "
back_home_len:
    .long . - back_home

check_olio:
    .ascii "5. Check Olio\n"
check_olio_len:
    .long . - check_olio

freccia:
    .ascii "> "
freccia_len:
    .long . - freccia

spazio:
    .ascii "  "
spazio_len:
    .long . - spazio

on:
    .ascii "ON\n"
on_len:
    .long . - on

off:
    .ascii "OFF\n"
off_len:
    .long . - off

sottomenu_porte:
    .ascii "SOTTO MENU BLOCCO AUTOMATICO PORTE\n\n\n"
sottomenu_porte_len:
    .long . - sottomenu_porte

stato_attuale:
    .ascii "STATO ATTUALE: "
stato_attuale_len:
    .long . - stato_attuale

usa_freccie:
    .ascii "1. USARE FRECCIE SU/GIU' MODIFICARE STATO\n"
usa_freccie_len:
    .long . - usa_freccie

sottomenu_back:
    .ascii "SOTTO MENU BACK-HOME\n\n\n"
sottomenu_back_len:
    .long . - sottomenu_back

sottomenu_olio:
    .ascii "SOTTO MENU CHACK OLIO\n\n\n"
sottomenu_olio_len:
    .long . - sottomenu_olio

indicazioni_sotolio:
    .ascii "UTILIZZARE FRECCIA DESTRA PER ESEGUIRE UN CHECK DELL'OLIO\n"
indicazioni_sotolio_len:
    .long . - indicazioni_sotolio

olio_fatto:
    .ascii "CHECK OLIO ESEGUITO CORRETTAMENTE\n\n\n"
olio_fatto_len:
    .long . - olio_fatto

.section .text
    .global _start

_start:
    # Pulizia dello schermo
    mov $4, %eax
    mov $1, %ebx
    mov $clear_screen, %ecx
    mov $6, %edx 
    int $0x80

et_stampamenu:


et_stampasett:
    movl $4, %eax
    movl $1, %ebx
    leal sett_auto, %ecx
    movl sett_auto_len, %edx
    int $0x80


et_stampadata:
    movl pos_freccia, %eax
    cmp $0, %eax
    je stmp_f_data
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
et_stampadata_c:
    movl $4, %eax
    movl $1, %ebx
    leal data, %ecx
    movl data_len, %edx
    int $0x80

et_stampaora:
    movl pos_freccia, %eax
    cmp $1, %eax
    je stmp_f_ora
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
et_stampaora_c:
    movl $4, %eax
    movl $1, %ebx
    leal ora, %ecx
    movl ora_len, %edx
    int $0x80


et_stampa_blocco:
    movl pos_freccia, %eax
    cmp $2, %eax
    je stmp_f_blocco
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
et_stampablocco_c:
    movl $4, %eax
    movl $1, %ebx
    leal blocco_porte, %ecx
    movl blocco_porte_len, %edx
    int $0x80
    movl stato_porte, %eax
    cmp $0, %eax
    je et_stampaonbl
    movl $4, %eax
    movl $1, %ebx
    leal off, %ecx
    leal off_len, %edx
    int $0x80

et_stampaback:
    movl pos_freccia, %eax
    cmp $3, %eax
    je stmp_f_back
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
et_stampaback_c:
    movl $4, %eax
    movl $1, %ebx
    leal back_home, %ecx
    movl back_home_len, %edx
    int $0x80
    movl stato_back, %eax
    cmp $0, %eax
    je et_stampaonba
    movl $4, %eax
    movl $1, %ebx
    leal off, %ecx
    leal off_len, %edx
    int $0x80


et_stampacheck:
    movl pos_freccia, %eax
    cmp $4, %eax
    je stmp_f_check
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
et_stampacheck_c:
    movl $4, %eax
    movl $1, %ebx
    leal check_olio, %ecx
    movl check_olio_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal acapo, %ecx
    movl acapo_len, %edx
    int $0x80


et_ricevo_carattere:
    movl $3, %eax
    xorl %ebx, %ebx
    leal tastiera, %ecx
    movl $4, %edx
    int $0x80
    movl $0, %esi
    movb tastiera(%esi), %al
    cmpb $27, %al
    jne guardo_enter
    incl %esi
    movb tastiera(%esi), %al
    cmpb $91, %al
    jne et_ricevo_carattere
    incl %esi
    movb tastiera(%esi), %al
    movl $0, tastiera
    cmpb $65, %al
    je freccia_su
    cmpb $66, %al
    je freccia_giu
    cmpb $67, %al
    je freccia_destra
    cmpb $68, %al
    je freccia_sinistra
guardo_enter:
    cmp $10, %al
    je et_end
    jmp et_ricevo_carattere

freccia_su:
    movl pos_freccia, %eax
    cmp $0, %eax
    je passasotto
    subl $1, %eax
    movl %eax, pos_freccia
    jmp et_stampamenu


freccia_giu:
    movl pos_freccia, %eax
    cmp $4, %eax
    je passasopra
    addl $1, %eax
    movl %eax, pos_freccia
    jmp et_stampamenu


freccia_destra:


freccia_sinistra:
    jmp et_end

passasotto:
    movl $4, pos_freccia
    jmp et_stampamenu

passasopra:
    movl $0, pos_freccia
    jmp et_stampamenu


et_stampaonbl:
    movl $4, %eax
    movl $1, %ebx
    leal on, %ecx
    movl on_len, %edx
    int $0x80
    jmp et_stampaback
    
et_stampaonba:
    movl $4, %eax
    movl $1, %ebx
    leal on, %ecx
    movl on_len, %edx
    int $0x80
    jmp et_stampacheck

#stampa la freccia se deve essere sulla data
stmp_f_data:
    movl $4, %eax
    movl $1, %ebx
    leal freccia, %ecx
    movl freccia_len, %edx
    int $0x80
    jmp et_stampadata_c

stmp_f_ora:
    movl $4, %eax
    movl $1, %ebx
    leal freccia, %ecx
    movl freccia_len, %edx
    int $0x80
    jmp et_stampaora_c

stmp_f_blocco:
    movl $4, %eax
    movl $1, %ebx
    leal freccia, %ecx
    movl freccia_len, %edx
    int $0x80
    jmp et_stampablocco_c

stmp_f_back:
    movl $4, %eax
    movl $1, %ebx
    leal freccia, %ecx
    movl freccia_len, %edx
    int $0x80
    jmp et_stampaback_c

stmp_f_check:
    movl $4, %eax
    movl $1, %ebx
    leal freccia, %ecx
    movl freccia_len, %edx
    int $0x80
    jmp et_stampacheck_c

et_end:
    movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
