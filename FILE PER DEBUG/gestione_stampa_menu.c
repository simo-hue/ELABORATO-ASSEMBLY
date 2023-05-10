#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#define num_voci_menu_standard 5
#define num_voci_menu_superuser 7

// VARIABILI GLOBALI:
struct datetime {
    int year;
    int month;
    int day;
    int hour;
    int minute;
};
// COME SCELTA PROGETTUALE SI SCEGLIE DI IMPOSTARE AD ON SIA BLOCCO PORTE CHE BACK-HOME:
char stati[2][10] = {"OFF", "ON"};
int blocco_porte = 1, back_home = 1;
int end = 0, lampeggio[3] = {3, 2, 5}; // lampeggio[0] VALORE SALVATO, lampeggio[1] VALORE MINIMO, lampeggio[2] VALORE MASSIMO:
struct datetime dt;

void stottomenu(char vociMenu[][100], int dim, int indice, int modalità){
    char c;
    int scelta, lampeggi, reset, porte, home;
    switch (indice)
    {
    // MENU STATICO CHE NON SERVE IMPLEMENTARE:
    case 0:
        printf("\n***********************************\n");
        printf("********* Sotto Menu Data *********\n");
        printf("***********************************\n");
        printf("\nFUSO ORARIO UTILIZZATO : GMT+2");
        scanf(" %c", &c);
        break;
    // MENU STATICO CHE NON SERVE IMPLEMENTARE:
    case 1:
        printf("\n***********************************\n");
        printf("********** Sotto Menu Ora *********\n");
        printf("***********************************\n");
        printf("\nFUSO ORARIO UTILIZZATO : GMT+2");
        scanf(" %c", &c);
        break;
    // MENU DOVE SI CAMBIA DA on A off E NIENT ALTRO:
    case 2:
        printf("\n**************************************\n");
        printf("* Sotto Menu Blocco Automatico Porte *\n");
        printf("**************************************\n\n");
        printf("\nSTATO ATTUALE: %s\n", stati[blocco_porte]);
        printf("1) PER MODIFICARE CAMBIARE STATO\n");
        scanf("%d", &porte);
        if(porte == 1){
            if(blocco_porte == 1){
                blocco_porte = 0;
            }else
            {
                blocco_porte = 1;
            }
        }
        break;
    // MENU DOVE SI CAMBIA DA on A off E NIENT ALTRO:    
    case 3:
        printf("\n*************************************\n");
        printf("******** Sotto Menu Back-Home *******\n");
        printf("*************************************\n");
        printf("\nSTATO ATTUALE: %s\n", stati[back_home]);
        printf("1) PER MODIFICARE CAMBIARE STATO\n");
        scanf("%d", &home);
        if(home == 1){
            if (back_home == 1)
            {
                back_home = 0;
            }else
            {
                back_home = 1;
            }  
        }
        break;
    // MENU FRECCE DIREZIONALI:
    case 4:
        if(modalità == 2244){
            printf("\n*************************************\n");
            printf("* Sotto Menu Check Frecce Direzione *\n");
            printf("*************************************\n");
            printf("\nSTATO ATTUALE: %d\n", lampeggio[0]);
            printf("1) PER MODIFICARE QUANTITA' LAMPEGGI\n");
            scanf("%d", &lampeggi);
            // UTENTE SCEGLIE, MA DEVE ESSERE NEL RANGE ALTRIMENTI PRENDE L'ESTREMO PIU' VICINO:
            if(lampeggi == 1){
                    printf("\nINSERIRE N° LAMPEGGI ( Minimo = 2 e Massimo = 5 ): ");
                    scanf("%d", &lampeggio[0]);
                    if(lampeggio[0] < 2){
                        lampeggio[0] = 2;
                    }else if(lampeggio[0] > 5){
                        lampeggio[0] = 5;
                    }
            }
        }else{
            // MENU STATICO CHE NON SERVE IMPLEMENTARE:
            printf("\n***********************************\n");
            printf("******* Sotto Menu Check Olio *****\n");
            printf("***********************************\n");
            scanf(" %c", &c);
        }
        break;
    // MENU STATICO CHE NON SERVE IMPLEMENTARE:
    case 5:
        printf("\n*************************************\n");
        printf("******* Sotto Menu Check Olio *******\n");
        printf("*************************************\n");
        scanf(" %c", &c);
        break;
    // MENU DOVE SI PUO' FARE SOLO RESET DELLA PRESSIONE:
    case 6:
        printf("\n************************************\n");
        printf("* Sotto Menu Reset Pressione Gomme *\n");
        printf("************************************\n");
        scanf("%d", &reset);
        if(reset == 1){
            printf("\nPRESSIONE RESETTATA CORRETTAMENTE");
            scanf(" %c", &c);
        }
        break;
    // DEFAULT:
    default:
        break;
    }
}

void stampaMenu(int modalità) {
    char c;
    int posizione = 0, dim;
    
    if(modalità == 2244){
        dim = num_voci_menu_superuser;
    }else{
        dim = num_voci_menu_standard;
    }
    char vociMenu[dim][100];
    // POPOLO IL MENU A SECONDA DELL'UTENTE:
    if(modalità == 2244){// SUPERUSER:
            strcpy(vociMenu[0], "1) Data: ");
            strcpy(vociMenu[1], "2) Ora: ");
            strcpy(vociMenu[2], "3) Blocco Automatico Porte: ");
            strcpy(vociMenu[3], "4) Back-Home: ");
            strcpy(vociMenu[4], "5) Frecce Direzione: ");
            strcpy(vociMenu[5], "6) Check olio;");
            strcpy(vociMenu[6], "7) Reset Pressione Gomme");
    }else{ // NORMALE:
            strcpy(vociMenu[0], "1) Data: ");
            strcpy(vociMenu[1], "2) Ora: ");
            strcpy(vociMenu[2], "3) Blocco Automatico Porte: ");
            strcpy(vociMenu[3], "4) Back-Home: ");
            strcpy(vociMenu[4], "5) Check Olio;");
    }

    // STAMPO VOCI DEL MENU:
    printf("Setting Automobile:\n");
    for (int i = 0; i < num_voci_menu_standard; i++) {
        printf("- %s\n", vociMenu[i]);          
    }
    printf("\n");
    printf("Premi freccia sinistra o destra per scorrere il menu\n");

    while (1) {
        // STAMPO VOCI DEL MENU:
        printf("\033[2J"); // PULISCO TERMINALE:
        printf("Setting Automobile:\n");
        for (int i = 0; i < dim; i++) {
            // TROVO TEMPO ISTANTANEO: 
                time_t current_time;
                struct tm *local_time;
                current_time = time(NULL);
                local_time = localtime(&current_time);
                // LO SALVO:
                dt.year = local_time->tm_year + 1900;
                dt.month = local_time->tm_mon + 1;
                dt.day = local_time->tm_mday;
                dt.hour = local_time->tm_hour;
                dt.minute = local_time->tm_min;

            // SEPARO I DATI ISTANTANEI CHE DEVO STAMPARE:
            switch (i)
            {
                case 0:
                    printf("\n");
                    break;
                case 1:
                    printf("%02d/%02d/%04d\n", dt.day, dt.month, dt.year);
                    break;
                case 2:
                    printf("%02d:%02d\n", dt.hour, dt.minute);
                    break;
                case 3:
                    printf("%s\n", stati[blocco_porte]);
                    break;
                case 4:
                    printf("%s\n", stati[back_home]);
                    break;
                case 5:
                    if(modalità == 2244){
                        printf("%d\n", lampeggio[0]);
                    }else{
                        printf("\n");
                    }
                    break;
                default:
                    printf("\n");
                    break;
            }
            if (i == posizione) {
                printf("> %s", vociMenu[i]); // PORTA IL CURSORE SULLA VOCE SELEZIONATA
            } else {
                printf("  %s", vociMenu[i]); // STAMPA SPAZIO VUOTO SULLE RIMANENTI
            }
        }
        printf("\n");

        c = getchar();

        // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
        if (c == '\033' && getchar() == '[') {
            c = getchar();
            switch (c)
            {
            case 'B':// FRECCIA GIU'
                if (posizione < dim - 1) {
                    posizione++;
                }
                break;
            case 'A':// FRECCIA SU
                if (posizione > 0) {
                    posizione--;
                }
                break;
            case 'C':// FRECCIA DESTRA ( per sotto-menu )
                stottomenu(vociMenu, dim, posizione, modalità);
                break;
            default:
                break;
            }
    }
}
}

int main(int argc, char const *argv[]) {
    // VARIABILI LOCALI MAIN:
    int modalità;
    
    // CONTROLLO SE UTENTE HA PASSATO PARAMETRI DA LINEA DI COMANDO:
    if(argc == 2){ 
         modalità = atoi(argv[1]); // Modalità SUPERVISOR
    } else{
        modalità = 1; // modalità DEFAULT
    }

    // PASSO IL PARAMETRO PASSATO DA LINEA DI COMANDO ( verrà controllato successivamente se equivale a super-user ):
    stampaMenu(modalità);

    return 0;
}
