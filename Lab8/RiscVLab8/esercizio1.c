#include <stdio.h>
extern int numSoluzioniReali(int a, int b, int c);

int main() {
	int a, b, c, risultato;

	printf("Inserisci il coefficiente a: ");
	scanf("%d", &a);
	printf("Inserisci il coefficiente b: ");
	scanf("%d", &b);
	printf("Inserisci il coefficiente c: ");
	scanf("%d", &c);

	risultato = numSoluzioniReali(a, b, c);
	printf("L'equazione %+dx^2 %+dx %+d ha %d soluzioni reali\n", a, b, c, risultato);
	return 0;
}