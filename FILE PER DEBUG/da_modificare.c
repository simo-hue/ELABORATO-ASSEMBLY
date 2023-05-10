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
int end = 0, lampeggio[3] = {3, 2, 5}; // lampeggio[0] valore salvato, lampeggio[1] valore minimo, lampeggio[2] valore massimo
struct datetime dt;

void stottomenu(char vociMenu[][100], int dim, int indice){
    char c;
    int scelta, lampeggi, reset, porte, home;
    switch (indice)
    {
    case 0:
        // MENU STATICO CHE NON SERVE IMPLEMENTARE
        printf("\n***********************************\n");
        printf("********* Sotto Menu Data *********\n");
        printf("***********************************\n");
        printf("\nFUSO ORARIO UTILIZZATO : GMT+2");
        scanf(" %c", &c);
        break;
    case 1:
        // MENU STATICO CHE NON SERVE IMPLEMENTARE
        printf("\n***********************************\n");
        printf("********** Sotto Menu Ora *********\n");
        printf("***********************************\n");
        printf("\nFUSO ORARIO UTILIZZATO : GMT+2");
        scanf(" %c", &c);
        break;
    case 2:
        printf("\n**************************************\n");
        printf("* Sotto Menu Blocco Automatico Porte *\n");
        printf("**************************************\n\n");
        printf("\nSTATO ATTUALE: %s\n", stati[blocco_porte]);
        printf("1) PER MODIFICARE CAMBIARE STATO\n");
        scanf("%d", &porte);
        // Se vuole cambiare passa da uno stato all'altro, non ci sono altre scelte
        if(porte == 1){
            if(blocco_porte == 1){
                blocco_porte = 0;
            }else
            {
                blocco_porte = 1;
            }
        }
        break;
    case 3:
        printf("\n*************************************\n");
        printf("******** Sotto Menu Back-Home *******\n");
        printf("*************************************\n");
        printf("\nSTATO ATTUALE: %s\n", stati[back_home]);
        printf("1) PER MODIFICARE CAMBIARE STATO\n");
        scanf("%d", &home);
        // Se vuole cambiare passa da uno stato all'altro, non ci sono altre scelte
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
    case 4:
        printf("\n*************************************\n");
        printf("* Sotto Menu Check Frecce Direzione *\n");
        printf("*************************************\n");
        printf("\nSTATO ATTUALE: %d\n", lampeggio[0]);
        printf("1) PER MODIFICARE QUANTITA' LAMPEGGI\n");
        scanf("%d", &lampeggi);
        // Utente può scegliere, ma se fuori range prenderà l'estremo più vicino
        if(lampeggi == 1){
                printf("\nINSERIRE N° LAMPEGGI ( Minimo = 2 e Massimo = 5 ): ");
                scanf("%d", &lampeggio[0]);
                if(lampeggio[0] < 2){
                    lampeggio[0] = 2;
                }else if(lampeggio[0] > 5){
                    lampeggio[0] = 5;
                }
        }
        break;
    case 5:
        printf("\n*************************************\n");
        printf("******* Sotto Menu Check Olio *******\n");
        printf("*************************************\n");
        scanf(" %c", &c);
        break;
    case 6:
        // Menu dove si può resettare la pressione e basta
        printf("\n************************************\n");
        printf("* Sotto Menu Reset Pressione Gomme *\n");
        printf("************************************\n");
        scanf("%d", &reset);
        if(reset == 1){
            printf("\nPRESSIONE RESETTATA CORRETTAMENTE");
        }
        break;
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
    // popolo il menu da stampare
    if(modalità == 2244){
            strcpy(vociMenu[0], "1) Data: ");
            strcpy(vociMenu[1], "2) Ora: ");
            strcpy(vociMenu[2], "3) Blocco Automatico Porte: ");
            strcpy(vociMenu[3], "4) Back-Home: ");
            strcpy(vociMenu[4], "5) Frecce Direzione: ");
            strcpy(vociMenu[5], "6) Check olio;");
            strcpy(vociMenu[6], "7) Reset Pressione Gomme");
            
    }else{
            strcpy(vociMenu[0], "1) Data: ");
            strcpy(vociMenu[1], "2) Ora: ");
            strcpy(vociMenu[2], "3) Blocco Automatico Porte: ");
            strcpy(vociMenu[3], "4) Back-Home: ");
            strcpy(vociMenu[4], "5) Check Olio;");
    }

    while (1) {
        // Stampa il menu
        printf("\033[2J"); // Pulisci lo schermo
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
                printf("> %s", vociMenu[i]); // stampa la voce selezionata
            } else {
                printf("  %s", vociMenu[i]); // stampa la voce non selezionata
            }
        }
        printf("\n");

        // Leggi il carattere dalla tastiera
        c = getchar();

        // Determina quale freccia è stata premuta
        if (c == '\033' && getchar() == '[') {
            c = getchar();
            switch (c)
            {
            case 'B':// Freccia giù
                if (posizione < dim - 1) {
                    posizione++;
                }
                break;
            case 'A':// Freccia su
                if (posizione > 0) {
                    posizione--;
                }
                break;
            case 'C':// Freccia sottomenu
                stottomenu(vociMenu, dim, posizione);
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
    if(argc == 2){ // Se utente ha passato un parametro
         modalità = atoi(argv[1]); // Modalità SUPERVISOR
    } else{
        modalità = 1; // modalità DEFAULT
    }

    stampaMenu(modalità);

    return 0;
}
