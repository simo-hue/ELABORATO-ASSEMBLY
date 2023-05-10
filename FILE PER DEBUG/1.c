#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>

#define MAX_ITEMS 5

// Funzione per la lettura di un singolo carattere dallo standard input
char getch() {
    char ch;
    struct termios oldt, newt;

    tcgetattr(STDIN_FILENO, &oldt);
    newt = oldt;
    newt.c_lflag &= ~(ICANON | ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, &newt);

    ch = getchar();

    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
    return ch;
}

// Funzione per la stampa del menu
void print_menu(int current_item) {
    system("clear");
    printf("Seleziona un'opzione:\n");
    for (int i = 1; i <= MAX_ITEMS; i++) {
        if (i == current_item) {
            printf("> ");
        } else {
            printf("  ");
        }
        printf("Voce %d\n", i);
    }
}

int main() {
    int current_item = 1;
    int ch;

    while (1) {
        print_menu(current_item);
        ch = getch();

        switch (ch) {
            case '\n':
                if (current_item == MAX_ITEMS) {
                    // Se l'utente seleziona l'ultima voce del menu, esci dal programma
                    system("clear");
                    return 0;
                } else {
                    // Altrimenti, stampa il messaggio corrispondente alla voce selezionata
                    system("clear");
                    printf("Hai selezionato la voce %d.\n", current_item);
                    sleep(2);
                }
                break;
            case 'A':
            case 'a':
                // Freccia su
                if (current_item > 1) {
                    current_item--;
                }
                break;
            case 'B':
            case 'b':
                // Freccia giù
                if (current_item < MAX_ITEMS) {
                    current_item++;
                }
                break;
        }
    }
}
