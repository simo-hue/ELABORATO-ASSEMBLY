#include <stdio.h>
#include <string.h>

int main() {
    char stati[2][10] = {"BACK", "HOME"};
    int back_home = 0; // stato iniziale
    int esciSottoMenu = 0;

    while (!esciSottoMenu) {
        printf("\033[2J"); // PULISCO TERMINALE:
        printf("\n*************************************\n");
        printf("******** Sotto Menu Back-Home *******\n");
        printf("*************************************\n");
        printf("\nSTATO ATTUALE: %s\n", stati[back_home]);
        printf("1) USARE FRECCIE SU/GIU' PER MODIFICARE CAMBIARE STATO\n");
        printf("2) PREMERE INVIO PER USCIRE\n");

        char input[100];
        fgets(input, sizeof(input), stdin);

        if (strcmp(input, "\n") == 0) {
            printf("Hai premuto invio\n");
            break;
        } else if (strcmp(input, "\033[A\n") == 0) {
            // FRECCIA SU (per cambiare stato)
            if (back_home == 1) {
                back_home = 0;
            } else {
                back_home = 1;
            }
        } else if (strcmp(input, "\033[B\n") == 0) {
            // FRECCIA GIU' (per cambiare stato)
            if (back_home == 1) {
                back_home = 0;
            } else {
                back_home = 1;
            }
        } else if (strcmp(input, "\033[C\n") == 0) {
            // FRECCIA DESTRA (per uscire)
            printf("CIAO\n");
        }
    }

    return 0;
}
