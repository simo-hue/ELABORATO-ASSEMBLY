#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define num_voci_menu_standard 6
#define num_voci_menu_superuser 8
void stampaMenu(int modalità) {
    char c;
    int posizione = 0, dim;
    
    if(modalità == 2244){
        dim = num_voci_menu_superuser;
    }else{
        dim = num_voci_menu_standard;
    }
    char vociMenu[dim][100];
    
    if(modalità == 2244){
            strcpy(vociMenu[0], "1) Setting Automobile;");
            strcpy(vociMenu[1], "2) Data: ");
            strcpy(vociMenu[2], "3) Ora: ");
            strcpy(vociMenu[3], "4) Blocco Automatico Porte: ");
            strcpy(vociMenu[4], "5) Back-Home: ");
            strcpy(vociMenu[5], "6) Check Olio;");
            strcpy(vociMenu[6], "7) Frecce Direzione;");
            strcpy(vociMenu[7], "8) Reset Pressione Gomme");
            
    }else{
            strcpy(vociMenu[0], "1) Setting Automobile;");
            strcpy(vociMenu[1], "2) Data: ");
            strcpy(vociMenu[2], "3) Ora: ");
            strcpy(vociMenu[3], "4) Blocco Automatico Porte: ");
            strcpy(vociMenu[4], "5) Back-Home;");
            strcpy(vociMenu[5], "6) Check Olio;");
    }

    printf("Menu:\n");
    for (int i = 0; i < num_voci_menu_standard; i++) {
        printf("- %s\n", vociMenu[i]); // stampa la voce del menu
    }
    printf("\n");
    printf("Premi freccia sinistra o destra per scorrere il menu\n");

    while (1) {
        // Stampa il menu
        printf("\033[2J"); // Pulisci lo schermo
        printf("Menu:\n");
        for (int i = 0; i < dim; i++) {
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
