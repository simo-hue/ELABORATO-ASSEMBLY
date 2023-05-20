.section .data

#dichiaro ogni cosa che devo scrivere

#per sottomenu frecce direzione
reset_frecce:
    .ascii "\n\n\nIl numero dei lampeggi è stato cambiato in: \n\n\n"
reset_frecce_len:
    .long . - reset_frecce

valore_per_super:
    .ascii "2244"


sottomenu_frecce:
    .ascii "\n\nSOTTOMENU FRECCE DIREZIONALI\n\nQui pui cambiare il numero di lampeggi delle frece\n\nNumero di lampeggi attuali: "
sottomenu_frecce_len:
    .long . - sottomenu_frecce

indicazioni_sotfrecce:
    .ascii "Inserisci un numer compreso tra 2 e 5\n\n"

indicazioni_sotfrecce_len:
    .long . - indicazioni_sotfrecce

num_lam_int:
    .long 3

num_lam_ascii:
    .ascii "3\n\n"
num_lam_ascii_len:
    .long . - num_lam_ascii

scritta_frecce:
    .ascii "6. Frecce direzionali\n"
scritta_frecce_len:
    .long . - scritta_frecce

scritta_pressione:
    .ascii "7. Reset pressione gomme\n"
scritta_pressione_len:
    .long . - scritta_pressione

#per sottomenu pressione gomme
sottomentu_pressione:
    .ascii "\n\nSOTTOMENU PRESSIONE GOMME\n\nQui puoi resettare la pressione delle gomme premendo la freccia destra\n\n"
sottomentu_pressione_len:
    .long . - sottomentu_pressione

risposta_pressione:
    .ascii "\n\n\n\n\nLa pressione delle gomme è stata resettata correttamente\n\n\n"
risposta_pressione_len:
    .long . - risposta_pressione

stato_superuser:
    .long 0

clear_screen:
    .ascii "\033[2J"

#ciò che prendo da tastiera
tastiera:
    .space 3

acapo:
    .ascii "\n"
acapo_len:
    .long . - acapo

pos_freccia:
    .long 0

#per gestire on e off

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
    .ascii "\n\n\nSOTTO MENU BLOCCO AUTOMATICO PORTE\n\n\n"
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
    .ascii "\n\n\nSOTTO MENU BACK-HOME\n\n\n"
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

#controllo se supervisor
    movl 4(%esp), %eax
    addl $4, %eax
    movl (%eax), %ebx
    movl  valore_per_super, %ecx
    cmp %ebx, %ecx
    jne et_stampamenu
    movl $1, stato_superuser

    
#stampo il menù iniziale

et_stampamenu:

#stampa Setting

et_stampasett:
    movl $4, %eax
    movl $1, %ebx
    leal sett_auto, %ecx
    movl sett_auto_len, %edx
    int $0x80

#stampa la data

et_stampadata:
    movl pos_freccia, %eax
    cmp $0, %eax
    je stmp_f_data
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
#se c'è la freccia può ripartire da qua   
et_stampadata_c:
    movl $4, %eax
    movl $1, %ebx
    leal data, %ecx
    movl data_len, %edx
    int $0x80

#stampa ora
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

#stampa blocco Porte
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
    movl off_len, %edx
    int $0x80

#stampa back-Home
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
    movl off_len, %edx
    int $0x80

#stampa check olio
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
    

et_controllo_supervisor:
    movl stato_superuser, %eax
    cmp $0, %eax
    je et_ricevo_carattere

et_stampa_frecce:
    movl pos_freccia, %eax
    cmp $5, %eax
    je stmp_f_freccia
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
    et_stampa_frecce_c:
    movl $4, %eax
    movl $1, %ebx
    leal scritta_frecce, %ecx
    movl scritta_frecce_len, %edx
    int $0x80
    jmp et_stampa_pressione

stmp_f_freccia:
    movl $4, %eax
    movl $1, %ebx
    leal freccia, %ecx
    movl freccia_len, %edx
    int $0x80
    jmp et_stampa_frecce_c

et_stampa_pressione:
    movl pos_freccia, %eax
    cmp $6, %eax
    je stmp_f_pres
    movl $4, %eax
    movl $1, %ebx
    leal spazio, %ecx
    movl spazio_len, %edx
    int $0x80
    et_stampa_pressione_c:
        movl $4, %eax
        movl $1, %ebx
        leal scritta_pressione, %ecx
        movl scritta_pressione_len, %edx
        int $0x80
        jmp et_ricevo_carattere

stmp_f_pres:
    movl $4, %eax
    movl $1, %ebx
    leal freccia, %ecx
    movl freccia_len, %edx
    int $0x80
    jmp et_stampa_pressione_c

#dopo aver stampato il menu' aspetto input da utente 
#controllo se sono state premute le freccie, codice 27, 91 e poi da 65 a 68
et_ricevo_carattere:
    movl $4, %eax
    movl $1, %ebx
    leal acapo, %ecx
    movl acapo_len, %edx
    int $0x80
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
#controllo se ha premuto invio
guardo_enter:
    cmp $10, %al
    je et_end
    #se non è stata premuta una freccia o l'invio continuo a chidere il carattere
    jmp et_ricevo_carattere

#in base a che freccia ho ricevuto eseguo
freccia_su:
    movl pos_freccia, %eax
    cmp $0, %eax
    je passasotto
    subl $1, %eax
    movl %eax, pos_freccia
    jmp et_stampamenu


freccia_giu:
    movl stato_superuser, %eax
    cmp $1, %eax
    je salta_su_super
    movl pos_freccia, %eax
    cmp $4, %eax
    je passasopra
    addl $1, %eax
    movl %eax, pos_freccia
    jmp et_stampamenu
    salta_su_super:
    movl pos_freccia, %eax
    cmp $6, %eax
    je passasopra
    addl $1, %eax
    movl %eax, pos_freccia
    jmp et_stampamenu



freccia_destra:
    jmp entrasottomenu


freccia_sinistra:
    jmp et_end

#serve per gestire la posizione dell'indicaore >
passasotto:
    movl stato_superuser, %eax
    cmp $1, %eax
    je passotsuper
    movl $4, pos_freccia
    jmp et_stampamenu
    passotsuper:
        movl $6, pos_freccia
        jmp et_stampamenu

passasopra:
    movl $0, pos_freccia
    jmp et_stampamenu

#entra nel sottomenu se possibile dopo aver schiacciato frecci destra
entrasottomenu:
    movl pos_freccia, %eax
    cmp $2, %eax
    je entrasotporte
    cmp $3, %eax
    je entrasotback
    cmp $5, %eax
    je entrafrecciedir
    cmp $6, %eax
    je entraresetpres
    jmp et_ricevo_carattere

#entra sottomenu blocco Porte
entrasotporte:
    movl $4, %eax
    movl $1, %ebx
    leal sottomenu_porte, %ecx
    movl sottomenu_porte_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal stato_attuale, %ecx
    movl stato_attuale_len, %edx
    int $0x80
    movl stato_porte, %eax
    cmp $0, %eax
    je stmp_on_sotporte
    movl $4, %eax
    movl $1, %ebx
    leal off, %ecx
    movl off_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal usa_freccie, %ecx
    movl usa_freccie_len, %edx
    int $0x80
    jmp input_sotporte

#stampa on nel sottomenu del blocco Porte
stmp_on_sotporte:
    movl $4, %eax
    movl $1, %ebx
    leal on, %ecx
    movl on_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal acapo, %ecx
    movl acapo_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal usa_freccie, %ecx
    movl usa_freccie_len, %edx
    int $0x80
    jmp input_sotporte

#nel sottomenu del blocco porte aspetto un input
input_sotporte:
    movl $3, %eax
    xorl %ebx, %ebx
    leal tastiera, %ecx
    movl $4, %edx
    int $0x80
    movl $0, %esi
    movb tastiera(%esi), %al
    cmpb $27, %al
    jne enter_sotporte
    incl %esi
    movb tastiera(%esi), %al
    cmpb $91, %al
    jne et_ricevo_carattere
    incl %esi
    movb tastiera(%esi), %al
    movl $0, tastiera
    cmpb $65, %al
    je freccia_su_sotporte
    cmpb $66, %al
    je freccia_su_sotporte
    enter_sotporte:
    cmp $10, %al
    je et_stampamenu
    jmp input_sotporte

freccia_su_sotporte:
    movl stato_porte, %eax
    cmp $0, %eax
    je cambio_in_1_porte
    movl $0, stato_porte
    jmp entrasotporte

cambio_in_1_porte:
    movl $1, stato_porte
    jmp entrasotporte

#entra sottomentu back-home
entrasotback:
    movl $4, %eax
    movl $1, %ebx
    leal sottomenu_back, %ecx
    movl sottomenu_back_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal stato_attuale, %ecx
    movl stato_attuale_len, %edx
    int $0x80
    movl stato_back, %eax
    cmp $0, %eax
    je stmp_on_back
    movl $4, %eax
    movl $1, %ebx
    leal off, %ecx
    movl off_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal usa_freccie, %ecx
    movl usa_freccie_len, %edx
    int $0x80
    jmp input_sotback
    stmp_on_back:
        movl $4, %eax
        movl $1, %ebx
        leal on, %ecx
        movl on_len, %edx
        int $0x80
        movl $4, %eax
        movl $1, %ebx
        leal usa_freccie, %ecx
        movl usa_freccie_len, %edx
        int $0x80
        jmp input_sotback

#chiedo input in sottomenu back-home
input_sotback:
    movl $3, %eax
    xorl %ebx, %ebx
    leal tastiera, %ecx
    movl $4, %edx
    int $0x80
    movl $0, %esi
    movb tastiera(%esi), %al
    cmpb $27, %al
    jne enter_sotback
    incl %esi
    movb tastiera(%esi), %al
    cmpb $91, %al
    jne et_ricevo_carattere
    incl %esi
    movb tastiera(%esi), %al
    movl $0, tastiera
    cmpb $65, %al
    je freccia_su_sotback
    cmpb $66, %al
    je freccia_su_sotback
    enter_sotback:
    cmp $10, %al
    je et_stampamenu
    jmp input_sotback

freccia_su_sotback:
    movl stato_back, %eax
    cmp $0, %eax
    je cambio_1_back
    movl $0, stato_back
    jmp entrasotback
    cambio_1_back:
        movl $1, stato_back
        jmp entrasotback


#entra sottomenu freccie direzione
entrafrecciedir:
    movl $4, %eax
    movl $1, %ebx
    leal sottomenu_frecce, %ecx
    movl sottomenu_frecce_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal num_lam_ascii, %ecx
    movl num_lam_ascii_len, %edx
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    leal indicazioni_sotfrecce, %ecx
    movl indicazioni_sotfrecce_len, %edx
    int $0x80

input_sotfrecce:
    movl $3, %eax
    movl $1, %ebx
    leal tastiera, %ecx
    movl $4, %edx
    int $0x80
    movl $0, %esi
    movb tastiera(%esi), %al
    cmp $10, %al
    je et_stampamenu
    cmp $48, %al
    je mettidue
    cmp $49, %al
    je mettidue
    cmp $50, %al
    je mettidue
    cmp $51, %al
    je mettiatre
    cmp $52, %al
    je mettiquattro
    cmp $53, %al
    je metticinque
    cmp $53, %al
    jg metticinque
    jmp input_sotfrecce

mettiatre:
    movl $0, %esi
    movb $51, num_lam_ascii(%esi)
    jmp controllosemaggiore

mettidue:
    movl $0, %esi
    movb $50, num_lam_ascii(%esi)
    jmp controllosemaggiore

mettiquattro:
    movl $0, %esi
    movb $52, num_lam_ascii(%esi)
    jmp controllosemaggiore

metticinque:
    leal num_lam_ascii, %esi
    movb $53, (%esi)
    jmp entrafrecciedir

controllosemaggiore:
    incl %esi
    movb tastiera(%esi), %al
    cmp $48, %al
    jl entrafrecciedir
    cmp $57, %al
    jg entrafrecciedir
    jmp metticinque

#entra sottomenu reset pressione
entraresetpres:
    movl $4, %eax
    movl $1, %ebx
    leal sottomentu_pressione, %ecx
    movl sottomentu_pressione_len, %edx
    int $0x80
    jmp input_sotpres

input_sotpres:
    movl $3, %eax
    movl $1, %ebx
    leal tastiera, %ecx
    movl $4, %edx
    int $0x80
    movl $0, %esi
    movb tastiera(%esi), %al
    cmpb $27, %al
    jne enter_sotpres
    incl %esi
    movb tastiera(%esi), %al
    cmpb $91, %al
    jne input_sotpres
    incl %esi
    movb tastiera(%esi), %al
    cmpb $67, %al
    je freccia_destra_sotpres
    jmp input_sotpres
    enter_sotpres:
    cmp $10, %al
    je et_stampamenu
    jmp input_sotpres

freccia_destra_sotpres:
    movl $4, %eax
    movl $1, %ebx
    leal risposta_pressione, %ecx
    movl risposta_pressione_len, %edx
    int $0x80
    jmp entraresetpres

#stampa on del blocco porte
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
