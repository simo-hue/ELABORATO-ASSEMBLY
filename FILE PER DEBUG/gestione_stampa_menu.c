#include <stdio.h>

int main() {
    char c;
    int posizione = 0;
    int num_voci_menu = 15;

    printf("Menu:\n");
    for (int i = 0; i < num_voci_menu; i++) {
        printf("- Voce %d\n", i + 1);
    }
    printf("\n");
    printf("Premi freccia sinistra o destra per scorrere il menu\n");

    while (1) {
        // Stampa il menu
        printf("\033[2J"); // Pulisci lo schermo
        printf("Menu:\n");
        for (int i = 0; i < num_voci_menu; i++) {
            if (i == posizione) {
                printf("> Voce %d\n", i + 1);
            } else {
                printf("  Voce %d\n", i + 1);
            }
        }
        printf("\n");

        // Leggi il carattere dalla tastiera
        c = getchar();

        // Determina quale freccia è stata premuta
        if (c == '\033' && getchar() == '[') {
            c = getchar();
            if (c == 'C') {
                // Freccia destra
                if (posizione < num_voci_menu - 1) {
                    posizione++;
                }
            } else if (c == 'D') {
                // Freccia sinistra
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
