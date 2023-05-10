// COSTANTI E INCLUDE NECESSARI:
#include <stdio.h>
#define num_voci_menu_standard 6
#define num_voci_menu_superuser 8

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

void stampaMenu(char vociMenu[][100]){
    while (1) {
        // Stampa il menu Super-User
        char c;
        int posizione = 0;
        printf("Menu:\n");
    for (int i = 0; i < num_voci_menu_standard; i++) {
        printf("- %s\n", vociMenu[i]); // stampa la voce del menu
    }
    printf("\n");
        printf("\033[2J"); // Pulisci lo schermo
        printf("Menu:\n");
        for (int i = 0; i < num_voci_menu_standard; i++) {
            if (i == posizione) {
                printf("> %s\n", vociMenu[i]); // stampa la voce selezionata
            } else {
                printf("  %s\n", vociMenu[i]); // stampa la voce non selezionata
            }
        }
        printf("\n");

        // Leggi il carattere dalla tastiera
        c = getchar();

        // Determina quale freccia è stata premuta
        if (c == '\033' && getchar() == '[') {
            c = getchar();
            if (c == 'B') {
                // Freccia giù
                if (posizione < num_voci_menu_standard - 1) {
                    posizione++;
                }
            } else if (c == 'A') {
                // Freccia su
                if (posizione > 0) {
                    posizione--;
                }
            } else {
                printf("Input non valido\n");
            }
        } else {
            printf("Input non valido\n");
        }
    }
}

int main(int argc, char const *argv[]) {
    char vociMenuStandard[num_voci_menu_standard][100] = {"1) Setting Automobile", "2) Data;", "3) Ora;", "4) Blocco Automatico Porte;", "5) Back-Home;", "6) Check Olio"};
    char vociMenuSuperUser[num_voci_menu_superuser][100] = {"1) Setting Automobile", "2) Data;", "3) Ora;", "4) Blocco Automatico Porte;", "5) Back-Home;", "6) Check Olio", "7) Frecce Direzione", "8) Reset Pressione Gomme"};
    
    // VARIABILI LOCALI MAIN:
    int modalità;
    
    // CONTROLLO SE UTENTE HA PASSATO PARAMETRI DA LINEA DI COMANDO:
    if(argc == 2){ // Se utente ha passato un parametro
         stampaMenu(vociMenuSuperUser); // Modalità SUPERVISOR
    } else{
        stampaMenu(vociMenuStandard); // modalità DEFAULT
    }

    return 0;
}
