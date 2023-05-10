#include <stdio.h>

int main() {
    char c;
    printf("Premi una freccia: ");

    // Leggi il carattere dalla tastiera
    c = getchar();

    // Determina quale freccia è stata premuta
    if (c == '\033' && getchar() == '[') {
        c = getchar();
        if (c == 'C') {
            printf("Freccia destra\n");
        } else if (c == 'D') {
            printf("Freccia sinistra\n");
        }
    } else {
        printf("Input non valido\n");
    }

    return 0;
}
