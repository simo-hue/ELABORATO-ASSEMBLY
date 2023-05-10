#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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

// STAMPA IL SOTTOMENU E PRENDE LA SCELTA:
void stampa(int user_type){
    int scelta, lampeggi, reset, porte, home;
    scanf("%d", &scelta);
    printf("\n------------------------------------\n");
    
    // Vado ad interrompere il programma se inserisce un numero fuori dal menu oppure uscita
    if(user_type != 2244 && scelta > 7){
        scelta = 0;
    } else if(user_type == 2244 && scelta > 9){
        scelta = 0;
    }

    switch (scelta){

    case 1:
        if( user_type == 2244){
            printf("\n*************************************\n");
            printf("* Setting Automobile ( supervisor ) *");
            printf("\n*************************************\n");
        }else{
            printf("\n***********************************\n");
            printf("** Sotto Menu Setting Automobile **");
            printf("\n***********************************\n");
        }
        break;
    
    case 2:
        // MENU STATICO CHE NON SERVE IMPLEMENTARE
        printf("\n***********************************\n");
        printf("********* Sotto Menu Data *********\n");
        printf("***********************************\n");
        printf("\nFUSO ORARIO UTILIZZATO : GMT+2");
        break;
    
    case 3:
        // MENU STATICO CHE NON SERVE IMPLEMENTARE
        printf("\n***********************************\n");
        printf("********** Sotto Menu Ora *********\n");
        printf("***********************************\n");
        printf("\nFUSO ORARIO UTILIZZATO : GMT+2");
        break;
    
    case 4:
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
    
    case 5:
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
    
    case 6:
        printf("\n*************************************\n");
        printf("******* Sotto Menu Check Olio *******\n");
        printf("*************************************\n");
        break;
    
    case 7:
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
    
    case 8:
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
        end = 1;
        break;
    }
}

// STAMPA MENU PRINCIPALE PERSONALIZZATO IN BASE ALL'UTENTE:
void stampaMenu(int user_type){

    // TROVO TEMPO ISTANTANEO: 
    time_t current_time;
    struct tm *local_time;
    current_time = time(NULL);
    local_time = localtime(&current_time);

    dt.year = local_time->tm_year + 1900;
    dt.month = local_time->tm_mon + 1;
    dt.day = local_time->tm_mday;
    dt.hour = local_time->tm_hour;
    dt.minute = local_time->tm_min;

    if(user_type == 2244){ // Modalità SUPERVISOR
        // STAMPO:
        printf("\n*************************************\n");
        printf("*********** MENU PRINCIPALE *********\n");
        printf("*************************************\n");
        printf("1) Setting Automobile ( Supervisor):\n");
        printf("2) Data: %02d/%02d/%04d\n", dt.day, dt.month, dt.year);
        printf("3) Ora: %02d:%02d\n", dt.hour, dt.minute);
        printf("4) Blocco Automatico Porte: %s\n", stati[blocco_porte]);
        printf("5) Back-Home: %s\n", stati[back_home]);
        printf("6) Check Olio\n");
        printf("7) Frecce Direzione\n");
        printf("8) Reset Pressione Gomme\n");        
        printf("9) Uscire dal Menu Principale\n");        
    } else{ // modalità DEFAULT
        // STAMPO:
        printf("1) Setting Automobile:\n");
        printf("2) Data: %02d/%02d/%04d\n", dt.day, dt.month, dt.year);
        printf("3) Ora: %02d:%02d\n", dt.hour, dt.minute);
        printf("4) Blocco Automatico Porte: %s\n", stati[blocco_porte]);
        printf("5) Back-Home: %s\n", stati[back_home]);
        printf("6) Check Olio\n");
        printf("7) Uscire dal Menu Principale\n");        
    }

    stampa(user_type);
}

int main(int argc, char const *argv[])
{
    // VARIABILI LOCALI MAIN:
    int modalità;
    
    // CONTROLLO SE UTENTE HA PASSATO PARAMETRI DA LINEA DI COMANDO:
    if(argc == 2){ // Se utente ha passato un parametro
         modalità = atoi(argv[1]); // Modalità SUPERVISOR
    } else{
        modalità = 1; // modalità DEFAULT
    }

    // MOSTRO IL MENU ALL'UTENTE
    while(end == 0){
        printf("\n\n------------------------------------\n");
        stampaMenu(modalità);

    }
    
    /* code */
    return 0;
}
