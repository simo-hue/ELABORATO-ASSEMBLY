#include <stdio.h>

int main() {
    char input[100];
    printf("Inserisci un input: ");
    fgets(input, sizeof(input), stdin);
    if (input[0] == '\n') {
        printf("Hai inserito invio\n");
    } else {
        printf("Hai inserito: %s", input);
    }
    return 0;
}
