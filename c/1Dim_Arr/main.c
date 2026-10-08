#include <stdio.h>
#include <stdlib.h>
#include <math.h>
/* run this program using the console pauser or add your own getch, system("pause") or input loop */

// 0 < n <= 500
void nhapY_nhapZ_themY_vaoArray_taiViTriZ(float array[]);
void xuatSoAmDauTien(float array[], int n);
void xuatSoLonNhat(float array[], int n);
void tinhCacSoTrongMang(float array[], int n);
void nhapMang(float array[], int n);
void xuatMang(float array[], int n);
void xuatSoLuongSoAm(float array[], int n);
void nhapX_tinhSoLanXuatHienCuaX(float array[], int n);
void xuatCacSoDuong_vaTongCuaNo(float array[], int n);
void nhapT_xoaPhanTu_taiViTri_t(float array[]);
void xuatMangTangDan(float array[], int n);
void tinhS(float array[], int n);


int main() {
	int n = 0;
	printf("So phan tu cua mang n = ");
	scanf("%d", &n);
	float array[n];
	// (a) Nhap mang 1 chieu
	nhapMang(array, n);
	// (b) Viet ham xuat mang ra man hinh
	xuatMang(array, n);
	// (c) Tinh tong cac so trong mang
	tinhCacSoTrongMang(array, n);
	// (d) Xuat cac so duong va tong cua no
	xuatCacSoDuong_vaTongCuaNo(array, n);
	// (e) Xuat so luong so am
	xuatSoLuongSoAm(array, n);
	// (f) Xuat so lon nhat
	xuatSoLonNhat(array, n);
	// (g) Xuat so am dau tien
	xuatSoAmDauTien(array, n);
	// (g) Nhap x va tinh so lan xuat hien cua x
	nhapX_tinhSoLanXuatHienCuaX(array, n);
	// (i) Nhap y, z. Them y vao array[z]
	nhapY_nhapZ_themY_vaoArray_taiViTriZ(array);
	// (j) Nhap t. Xoa phan tu tai vi tri t
	nhapT_xoaPhanTu_taiViTri_t(array);
	// (k) Viet ham tinh S
	tinhS(array, n);
	// (l) Xuat mang tang dan
	xuatMangTangDan(array, n);
	return 0;
}

void xuatMangTangDan(float array[], int n)
{

}


void tinhS(float array[], int n)
{
	int i, j = 1;
	float s = 0;
	double base = 0;
	double tu = 0;
	double temp = 0;
	int mau = 0;
	
	for(i = 1; i <= n; i++)
	{
		base = (double)array[i-1];
		tu = pow(base, (double)i);
		for(j = 1; j <= i; j++)
		{
			mau += j;
		}
//		debug
//		printf("\ni = %d", i);
//		printf("\nBase = %f", base);
//
//		printf("\nTu = %f", tu);
//		printf("\nMau = %d", mau);
//		debug
		temp = tu/ mau;
//		printf("\na[%d]/mau = %f", (i - 1), temp);	// debug

		mau = 0;
		s+= temp;
	}
	
	printf("\ns = %f", s);
}

void nhapT_xoaPhanTu_taiViTri_t(float array[])
{
	int t = 0;
	
	printf("\nNhap t = ");
	scanf("%d", &t);
	array[t] = '\0';
	printf("Xoa phan tu tai vi tri t -> array[%d] = %f", t, array[t]);

}

void nhapY_nhapZ_themY_vaoArray_taiViTriZ(float array[])
{
	float y = 0;
	int z = 0;
	
	printf("\nNhap y = ");
	scanf("%f", &y);
	printf("\nNhap z = ");
	scanf("%d", &z);
	array[z] = y;
	printf("array[%d] = y = %f", z, y);
}

void nhapX_tinhSoLanXuatHienCuaX(float array[], int n)
{
	int i = 0;
	int count = 0;
	float x = 0;
	
	printf("\nNhap x = ");
	scanf("%f", &x);
	
	for (i = 0; i < n; i++)
	{
		if (array[i] == x)
		{
			count++;
		}
	}
	printf("\nSo lan xuat hien cua x la: %d", count);
}

void xuatSoAmDauTien(float array[], int n)
{
	int i = 0;
	float temp = 0;
	int flag_coSoAm = 0;
	for(i = 0; i < n; i++)
	{
		if (array[i] < 0)
		{
			temp = array[i];
			printf("\nSo am dau tien = %f", temp);
			flag_coSoAm = 1;
			break;
		}
	}
	
	if (flag_coSoAm == 0)
	{
		printf("\nKhong co so am nao");
	}
}

void xuatSoLonNhat(float array[], int n)
{
	float max = 0;
	
	int i = 0;
	
	for(i = 0; i < n; i++)
	{
		if(array[i] > max)
		{
			max = array[i];
		}
	}
	printf("\nSo lon nhat = %f", max);
}

void xuatSoLuongSoAm(float array[], int n)
{
	int count = 0;
	int i = 0;
	
	for(i = 0; i < n; i++)
	{
		if (array[i] < 0)	count ++;
	}
	printf("\nSo luong so am = %d", count);
}

void tinhCacSoTrongMang(float array[], int n)
{
	float tong = 0;
	int i = 0;
	
	for(i = 0; i < n; i++)
	{
		tong += array[i];
	}
	printf("\nTong cac so trong mang = %f", tong);
}
void xuatCacSoDuong_vaTongCuaNo(float array[], int n)
{
	int i = 0;
	float tongCuaCacSoDuong = 0;
	
	for(i = 0; i < n; i++)
	{
		if (array[i] > 0)
		{
			printf("\nNhap array[%d] = %f", i, array[i]);
			tongCuaCacSoDuong += array[i];
		}
	}
	printf("\nTong cac so duong trong mang = %f", tongCuaCacSoDuong);

}

void nhapMang(float array[], int n)
{
	int i = 0;
	
	for(i = 0; i < n; i++)
	{
		printf("\nNhap array[%d] = ", i);
		scanf("%f", &array[i]);
	}
}

void xuatMang(float array[], int n)
{
	int i = 0;
	
	for(i = 0; i < n; i++)
	{
		printf("\narray[%d] = %f", i, array[i]);
	}
}
