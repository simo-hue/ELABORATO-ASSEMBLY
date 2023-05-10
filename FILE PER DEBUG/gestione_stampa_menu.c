#include <stdio.h>

int main() {
    char c;
    int posizione = 0;
    int num_voci_menu = 15;
    int voci_per_pagina = 5;
    int pagina = 0;

    printf("Menu:\n");
    for (int i = 0; i < num_voci_menu; i++) {
        printf("- Voce %d\n", i + 1);
    }
    printf("\n");
    printf("Premi freccia sinistra o destra per scorrere il menu\n");

    while (1) {
        // Stampa il menu a partire dalla posizione corrente
        printf("\033[2J"); // Pulisci lo schermo
        printf("Menu:\n");
        for (int i = pagina * voci_per_pagina; i < (pagina + 1) * voci_per_pagina && i < num_voci_menu; i++) {
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
                if (pagina < (num_voci_menu - 1) / voci_per_pagina) {
                    pagina++;
                }
            } else if (c == 'D') {
                // Freccia sinistra
                if (pagina > 0) {
                    pagina--;
                }
            } else {
                printf("Input non valido\n");
            }
        } else {
            printf("Input non valido\n");
        }

        // Aggiorna la posizione corrente in base alla pagina corrente
        posizione = pagina * voci_per_pagina;
    }

    return 0;
}
