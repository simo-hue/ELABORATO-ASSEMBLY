#include <stdio.h>

int main() {
    char input[100];
    printf("Inserisci un input: ");
    fgets(input, sizeof(input), stdin);
    if (input[0] == '\n') {
        printf("Hai premuto invio\n");
    } else if (input[0] == '\033' && input[1] == '[') {
        switch (input[2]) {
            case 'D':
                printf("Hai premuto la freccia sinistra\n");
                break;
            case 'C':
                printf("Hai premuto la freccia destra\n");
                break;
            default:
                break;
        }
    } else {
        printf("Hai inserito: %s", input);
    }
    return 0;
}
