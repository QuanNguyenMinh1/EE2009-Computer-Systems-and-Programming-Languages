#include <stdio.h>
#include <string.h>
#include <ctype.h>

void xuLyChuoi(char s[])
{
	int i, j = 0;
	for (i = 0; i < strlen(s); i++)
	{
		if(s[i] != ' ' || j > 0 && s[j-1] != ' ')
		{
			s[j++] = s[i];
		}
	}
	
	if (j > 0 && s[j-1] == ' ')
	{
		s[j-1] = '\0';
	}
	else
	{
		s[j-1 + 1] = '\0';
	}
	
	for (i = 0; s[i] != '\0'; i++)
	{
		if (i == 0 || s[i - 1] == ' ')
		{
			s[i] = toupper(s[i]);
		}
		else
		{
			s[i] = tolower(s[i]);
		}
	}
	
	printf("Chuoi sau khi xu ly: \"%s\"\n", s);
}

int main()
{
	char s[200];
	
	fgets(s, sizeof(s), stdin);
	
	if (s[strlen(s) - 1] == '\n')	s[strlen(s) - 1] = '\0';
	
	xuLyChuoi(s);
	
	
	return 0;
}
