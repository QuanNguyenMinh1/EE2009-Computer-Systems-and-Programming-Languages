#include <stdio.h>
#include <conio.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */



int main() {
	int i, m, s = 0;
	
	printf("\nMoi nhap so nguyen duong m=");
	scanf("%d", &m);
	
	while (m < 0)
	{
		printf("\nMoi nhap so nguyen duong m=");
		scanf("%d", &m);
	}
	for (i = 0; i <= m; i++)
	{
		s += 2*i;
	}
	printf("s = %d", s);
	getch();
}
