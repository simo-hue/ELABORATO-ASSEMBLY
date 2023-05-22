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

// STAMPA TUTTI I SOTTO MENU IN BASE ALL'UTENTE E MODIFICA EVENTUALI PARAMETRI:
void stottomenu(int indice, int modalità){
    char c, input[100];
    int esciSottoMenu = 0;
    switch (indice)
    {
    // MENU STATICO CHE NON SERVE IMPLEMENTARE:
    case 0:
        esciSottoMenu = 0; // DEVE RIMANERE NEL SOTTO-MENU

        c = getchar(); // ALTRIMENTI NON VISUALIZZA IL SOTTOMENU

        while(!esciSottoMenu){
            system("clear");  // PULISCO TERMINALE:
            printf("\n***********************************\n********* Sotto Menu Data *********\n***********************************\n\nFUSO ORARIO UTILIZZATO : GMT+2\n");

            // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
            fgets(input, sizeof(input), stdin);
            if (input[0] == '\n') {
                esciSottoMenu = 1;
            }
        }
        break;
    // MENU STATICO CHE NON SERVE IMPLEMENTARE:
    case 1:
        esciSottoMenu = 0; // DEVE RIMANERE NEL SOTTO-MENU

        c = getchar(); // ALTRIMENTI NON VISUALIZZA IL SOTTOMENU

        while(!esciSottoMenu){
            system("clear");  // PULISCO TERMINALE:
            printf("\n***********************************\n********** Sotto Menu Ora *********\n***********************************\n\nFUSO ORARIO UTILIZZATO : GMT+2\n");

            // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
            fgets(input, sizeof(input), stdin);
            if (input[0] == '\n') {
                esciSottoMenu = 1;
            }
        }
        break;
    // MENU DOVE SI CAMBIA DA on A off E NIENT ALTRO:
    case 2:
        esciSottoMenu = 0; // DEVE RIMANERE NEL SOTTO-MENU
        
        c = getchar(); // ALTRIMENTI NON VISUALIZZA IL SOTTOMENU

        while(!esciSottoMenu){
            system("clear");  // PULISCO TERMINALE:
            printf("\n**************************************\n* Sotto Menu Blocco Automatico Porte *\n**************************************\n\n\nSTATO ATTUALE: %s\n1) USARE FRECCIE SU/GIU' PER MODIFICARE CAMBIARE STATO\n", stati[blocco_porte]);

            // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
            fgets(input, sizeof(input), stdin);
            if (input[0] == '\n') {
                esciSottoMenu = 1;
            } else if (input[0] == '\033' && input[1] == '[') {
                switch (input[2]){
                case 'A':// FRECCIA SU ( per cambiare stato )
                    blocco_porte = !blocco_porte; 
                    break;
                case 'B':// FRECCIA GIU' ( per cambiare stato )
                    blocco_porte = !blocco_porte;
                    break;
                default:
                    break;
                }
            }
        }
        break;
    // MENU DOVE SI CAMBIA DA on A off E NIENT ALTRO:    
    case 3:
        esciSottoMenu = 0; // DEVE RIMANERE NEL SOTTO-MENU

        c = getchar();

        while (!esciSottoMenu){
            system("clear");  // PULISCO TERMINALE:
            printf("\n*************************************\n******** Sotto Menu Back-Home *******\n*************************************\n\nSTATO ATTUALE: %s\n1) USARE FRECCIE SU/GIU' PER MODIFICARE CAMBIARE STATO\n", stati[back_home]);


            // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
            fgets(input, sizeof(input), stdin);
            if (input[0] == '\n') {
                esciSottoMenu = 1;
            } else if (input[0] == '\033' && input[1] == '[') {
                switch (input[2]){
                case 'A':// FRECCIA SU ( per cambiare stato )
                    back_home = !back_home;
                    break;
                case 'B':// FRECCIA GIU' ( per cambiare stato )
                    back_home = !back_home;
                    break;
                default:
                    break;
                }
            }
        }
        
        break;
    // MENU FRECCE DIREZIONALI:
    case 4:
        if(modalità == 2244){
            esciSottoMenu = 0; // DEVE RIMANERE NEL SOTTO-MENU

            c = getchar();

            while(!esciSottoMenu){
                system("clear");  // PULISCO TERMINALE:
                printf("\n**************************************\n**** Sotto Menu Frecce Direzione *****\n**************************************\n\nSTATO ATTUALE: %d\n1) FRECCIA DESTRA PER MODIFICARE QUANTITA' LAMPEGGI\n", lampeggio[0]);

            // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
            fgets(input, sizeof(input), stdin);
            if (input[0] == '\n') {
                esciSottoMenu = 1;
            } else if (input[0] == '\033' && input[1] == '[') {
                switch (input[2]){
                    case 'C':// FRECCIA SU ( per cambiare stato )
                    // UTENTE SCEGLIE, MA DEVE ESSERE NEL RANGE ALTRIMENTI PRENDE L'ESTREMO PIU' VICINO:
                            printf("\nINSERIRE N° LAMPEGGI ( Minimo = 2 e Massimo = 5 ): ");
                            scanf("%d", &lampeggio[0]);
                            if(lampeggio[0] < 2){
                                lampeggio[0] = 2;
                            }else if(lampeggio[0] > 5){
                                lampeggio[0] = 5;
                            }
                            c = getchar(); // ALTRIMENTI TORNA NEL MENU PRINCIPALE
                        break;
                    default:
                        break;  
                    }
                }
            }    
        }else{
            c = getchar();

            while (!esciSottoMenu)
            {
                system("clear");  // PULISCO TERMINALE:
                // MENU STATICO CHE NON SERVE IMPLEMENTARE:
                printf("\n***********************************\n******* Sotto Menu Check Olio *****\n***********************************\n\n1) UTILIZZARE FRECCIA DESTRA PER ESEGUIRE UN CHECK DELL'OLIO\n");
                
                // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
                fgets(input, sizeof(input), stdin);
                if (input[0] == '\n') {
                    esciSottoMenu = 1;
                } else if (input[0] == '\033' && input[1] == '[') {                
                    switch (input[2]){
                    case 'C':// FRECCIA DESTRA ( Vuole fare reset pressione )
                        printf("\nCHECK OLIO ESEGUITO CORRETTAMENTE\n");
                        
                        fflush(stdout);  // PER ASSICURARMI CHE VENGA STAMPATA IMMEDIATAMENTE LA STRINGA DI CONFERMA

                        time_t start_time = time(NULL);  // OTTENGO IL TEMPO INIZIALE

                        while (time(NULL) - start_time < 2) {} // METTO IN PAUSA IL PROGRAMMA PER 2 SECONDI
                        esciSottoMenu = 1; // DOPO CHE E' PASSATO IL TEMPO, TORNO AL MENU PRINCIPALE
                        break;
                    default:
                        break;
                    }
                }
            }
        }
        break;
    // MENU STATICO CHE NON SERVE IMPLEMENTARE:
    case 5:
        esciSottoMenu = 0;
        
        c = getchar();

        while (!esciSottoMenu)
        {
                system("clear");  // PULISCO TERMINALE:
                // MENU STATICO CHE NON SERVE IMPLEMENTARE:
                printf("\n***********************************\n******* Sotto Menu Check Olio *****\n***********************************\n\n1) UTILIZZARE FRECCIA DESTRA PER ESEGUIRE UN CHECK DELL'OLIO\n");
                
                // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
                fgets(input, sizeof(input), stdin);
                if (input[0] == '\n') {
                    esciSottoMenu = 1;
                } else if (input[0] == '\033' && input[1] == '[') {                
                    switch (input[2]){
                    case 'C':// FRECCIA DESTRA ( Vuole fare reset pressione )
                        printf("\nCHECK OLIO ESEGUITO CORRETTAMENTE\n"); // QUALSIASI TASTO PREMUTO LO FARA' TORNARE NEL SOTTOMENU
                        
                        fflush(stdout);  // PER ASSICURARMI CHE VENGA STAMPATA IMMEDIATAMENTE LA STRINGA DI CONFERMA

                        time_t start_time = time(NULL);  // OTTENGO IL TEMPO INIZIALE

                        while (time(NULL) - start_time < 2) {} // METTO IN PAUSA IL PROGRAMMA PER 2 SECONDI
                        esciSottoMenu = 1; // DOPO CHE E' PASSATO IL TEMPO, TORNO AL MENU PRINCIPALE
                        break;
                    default:
                        break;
                    }
                }
        }
        break;
    // MENU DOVE SI PUO' FARE SOLO RESET DELLA PRESSIONE:
    case 6:
        esciSottoMenu = 0;

        c = getchar();
        
        while (!esciSottoMenu)
        {

            system("clear");  // PULISCO TERMINALE:
            printf("\n************************************\n* Sotto Menu Reset Pressione Gomme *\n************************************\n\n1) UTILIZZARE FRECCIA DESTRA PER ESEGUIRE UN RESET DELLA PRESSIONE\n");
            
            // DIFFERENZIO LE VARIE CASISTICHE DI TASTI PREMUTI:
                fgets(input, sizeof(input), stdin);
                if (input[0] == '\n') {
                    esciSottoMenu = 1;
                } else if (input[0] == '\033' && input[1] == '[') {   
                switch (input[2]){
                case 'C':// FRECCIA DESTRA ( Vuole fare reset pressione )
                    printf("\nPRESSIONE RESETTATA CORRETTAMENTE\n"); // QUALSIASI TASTO PREMUTO LO FARA' TORNARE NEL SOTTOMENU
                    
                        fflush(stdout);  // PER ASSICURARMI CHE VENGA STAMPATA IMMEDIATAMENTE LA STRINGA DI CONFERMA

                        time_t start_time = time(NULL);  // OTTENGO IL TEMPO INIZIALE

                        while (time(NULL) - start_time < 2) {} // METTO IN PAUSA IL PROGRAMMA PER 2 SECONDI
                        esciSottoMenu = 1; // DOPO CHE E' PASSATO IL TEMPO, TORNO AL MENU PRINCIPALE
                    break;
                default:
                    break;
                }
            }
        }
        break;
    // DEFAULT:
    default:
        break;
    }
}

// STAMPA IL MENU PRINCIPALE IN BASE ALL'UNTENTE:
void stampaMenu(int modalità) {
    char c;
    int posizione = 0, dim, fine = 0;
    
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

    while (!fine) {
        // STAMPO VOCI DEL MENU:
        system("clear");  // PULISCO TERMINALE:
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
                if (posizione < dim - 1) { // NEL CASO NON SIA IN FONDO AL MENU
                    posizione++;
                }else if (posizione == dim - 1) { // EVENTUALMENTE RIPORTO SOPRA IL CURSORE
                    posizione = 0;
                }
                break;
            case 'A':// FRECCIA SU
                if (posizione > 0) { // NEL CASO NON SIA IN CIMA AL MENU
                    posizione--;
                }else if(posizione == 0){ // EVENTUALMENTE RIPORTO GIU' IL CURSORE
                    posizione = dim - 1;
                }
                break;
            case 'D':// USCITA DAL MENU PRINCIPALE
                system("clear");  // PULISCO TERMINALE:
                fine = 1;
                break;
            case 'C':// FRECCIA DESTRA ( per sotto-menu )
                stottomenu(posizione, modalità);
                break;
            default:
                break;
            }
        }
    }
}

// MAIN:
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
