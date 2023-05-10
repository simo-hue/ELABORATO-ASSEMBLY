#include <stdio.h>
#define num_voci_menu_standard 6
#define num_voci_menu_superuser 8
int main() {
    char c;
    int posizione = 0;
    char vociMenu[num_voci_menu_standard][100] = {"1) Setting Automobile", "2) Data;", "3) Ora;", "4) Blocco Automatico Porte;", "5) Back-Home;", "6) Check Olio"};
    char vociMenuSuperUser[num_voci_menu_superuser][100] = {"1) Setting Automobile", "2) Data;", "3) Ora;", "4) Blocco Automatico Porte;", "5) Back-Home;", "6) Check Olio", "7) Frecce Direzione", "8) Reset Pressione Gomme"};
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

    return 0;
}
