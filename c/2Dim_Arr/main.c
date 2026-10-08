#include <stdio.h>
#include <string.h>
#include <math.h>

void xuatMang(int a[][30], int m, int n);
int tongMang(int a[][30], int m, int n);
void xuatSoChan_vaTongCuaChung(int a[][30], int m, int n);
void xuatMax(int a[][30], int m, int n);
void xuatSoLuong_soAm(int a[][30], int m, int n);
int laSo_nguyenTo(int n);
void xuatCacSo_nguyenTo(int a[][30], int m, int n);
void xuatSoLanXuatHien_cuaX(int a[][30], int m, int n);

int main()
{
	int i, j, m, n, a[30][30], tong;
	printf("Nhap m: ");
	scanf("%d", &m);
	printf("Nhap n: ");
	scanf("%d", &n);
	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			printf("a[%d][%d] = ", i, j);
			scanf("%d", &a[i][j]);
		}
	}
	xuatMang(a, m, n);
	tong = tongMang(a, m, n);	printf("Tong cac so trong mang = %d\n", tong);
	xuatSoChan_vaTongCuaChung(a,m,n);
	xuatSoLuong_soAm(a,m,n);
	xuatMax(a,m,n);
	xuatCacSo_nguyenTo(a, m, n);
	xuatSoLanXuatHien_cuaX(a,m,n);
	
	return 0;
}

void xuatSoLanXuatHien_cuaX(int a[][30], int m, int n)
{
	int i, j, x, count = 0;
	
	printf("Nhap x = ");
	scanf("%d", &x);

	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			if (x == a[i][j])
			{
				count++;
			}
		}
	}
	printf("\nSo lan xuat hien cua x la: %d\n", count);
}

void xuatCacSo_nguyenTo(int a[][30], int m, int n)
{
	int i, j = 0;
	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			if (laSo_nguyenTo(a[i][j]))	printf("a[%d][%d] = %d la so nguyen to\n", i, j, a[i][j]);
		}
	}
}

int laSo_nguyenTo(int n)
{
	//case 1: so < 2 -> ko phai la so nguyen to
	if (n < 2)	return 0;
	//case 2: so chia het cho so khac no -> k phai la so nguyen to
	int i = 0;
	for (i = 2; i <= sqrt(n); i++)
	{
		if(n % i == 0)
		{
			return 0;
		}
		return 1;
	}
}

void xuatMax(int a[][30], int m, int n)
{
	int i, j, max = 0;
	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			if(a[i][j] > max)
			{
				max = a[i][j];
			}
		}
	}
	printf("So lon nhat trong mang: %d\n", max);
}

void xuatSoLuong_soAm(int a[][30], int m, int n)
{
	int i, j, count = 0;
	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			if(a[i][j] < 0)
			{
				count++;
			}
		}
	}
	printf("So luong so am = %d\n", count);
}

void xuatSoChan_vaTongCuaChung(int a[][30], int m, int n)
{
	int i, j, tong = 0;
	printf("Cac so chan:\n");
	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			if((a[i][j] % 2) == 0)
			{
				printf("%d\n", a[i][j]);
				tong += a[i][j];
			}
		}
	}
	printf("Tong cua cac so chan = %d\n", tong);
}

int tongMang(int a[][30], int m, int n)
{
	int i, j, tong = 0;
	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			tong += a[i][j];
		}
	}
	return tong;
}


void xuatMang(int a[][30], int m, int n)
{
	int i, j;
	for(i = 0; i < m; i++)
	{
		for(j = 0; j < n; j++)
		{
			printf("a[%d][%d] = %d ", i, j, a[i][j]);
		}
		printf("\n");
	}
}

