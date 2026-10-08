#include <stdio.h>
#include <conio.h>

//void swap(int *a, int* b)
//{
//	int temp = *a;
//	*a = *b;
//	*b = temp;
//}

void nhapNamSinh(int a[], int n)
{
	int i;
	for (i = 0; i < n; i++)
	{
		printf("Nhap a[%d] = ", i);
		scanf("%d", &a[i]);
	}
}

//void sapXep(int a[], int n)
//{
//	int i, j;
//	// dung bubble sort		i = 0 -> n - 2		j = 0 -> n - i - 2
//	//	if (a[j] < a[j+1])	swap(&a[j], &a[j + 1));
//	
//	for (i = 0; i < n - 1; i++)
//	{
//		for (j = 0; j < n - i - 1; j++)
//		{
//			if (a[j] > a[j+1])	swap(&a[j], &a[j + 1]);		// >: tang dan, <: giam dan
//		}
//
//	}
//	
//	for(i = 0; i < n; i++)
//	{
//		printf("a[%d] = %d\n", i, a[i]);
//	}
//}


void swap(int* a, int* b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

void sapXep(int a[], int n)
{
	int i, j;
	for(i = 0; i < n - 1; i ++)
	{
		for(j = 0; j < n - i - 1; j++)
		{
			if (a[j] < a[j+1])	swap(&a[j], &a[j+1]);
		}
	}
	
	
	for (i = 0; i < n; i++)
	{
		printf("a[%d] = %d\n", i, a[i]);
	}
}

int main()
{
	int n;
	printf("Nhap so luong thanh vien = ");
	scanf("%d", &n);
	
	int a[n];
	
	nhapNamSinh(a, n);
	sapXep(a, n);
	getch();
}
