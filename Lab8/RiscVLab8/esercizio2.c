#include <stdio.h>

extern int diagonale_o_simmetrica(int *matrice, int dim);

int main() {
	int matrice[] = {
		1, 0, 0, 0, 0,
		0, 2, 0, 1, 0,
		0, 0, 3, 0, 0,
		0, 1, 0, 4, 0,
		0, 0, 0, 0, 5
	};
	int risultato;
	risultato = diagonale_o_simmetrica(matrice, 5);
	switch (risultato) {
		case 0:
			printf("La matrice non e' simmetrica");
			break;
		case 1:
			printf("La matrice e' simmetrica");
			break;
		case 2:
			printf("La matrice e' diagonale");
			break;
	}
	return 0;
}