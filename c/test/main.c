#include <stdio.h>
#include <conio.h>

void swap(int* a, int* b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

void nhap_namSinh(int a[], int n)
{
	int i;
	for(i = 0; i < n; i++)
	{
		printf("\nNhap nam sinh thanh vien thu %d: ", i+1);
		scanf("%d", &a[i]);
	}
}

void xuat_namSinh(int a[], int n)
{
	int i, j;
	// bubble sort
	for (i = 0; i < n - 1; i++)
	{
		for (j = 0; j < n - i - 1; j++)
		{
			if (a[j] < a[j+1])	swap(&a[j], &a[j+1]);
		}
	}
	
	for(i = 0; i < n; i++)
	{
		printf("\nNam sinh giam dan: %d", a[i]);
	}
}

void demXuat_hon2000(int a[], int n)
{
	int i, count = 0;
	for(i = 0; i < n; i++)
	{	
		if (a[i] > 2000)
		{
			count++;
		}
	}
	printf("\nCo %d thanh vien co nam sinh > 2000 la:", count);

	for(i = 0; i < n; i++)
	{	
		if (a[i] > 2000)
		{
			printf("\na[%d]: %d", i, a[i]);
		}
	}
}

void xuat3TV_min(int a[], int n)
{
	int i;
	printf("\n3 thanh vien co nam sinh be nhat la: ");

	for(i = n - 1; i > n - 1 - 3; i--)
	{
		printf("\na[%d] = %d", i, a[i]);
	}
}

int main()
{
	int n;
	printf("Nhap so luong thanh vien clb: ");
	scanf("%d", &n);
	int a[n];
	nhap_namSinh(a, n);
	xuat_namSinh(a, n);
	demXuat_hon2000(a, n);
	xuat3TV_min(a, n);
	
	
	getch();
}
