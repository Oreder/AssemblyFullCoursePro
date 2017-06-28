#include "stdafx.h"
#include <iostream>
using namespace std;

extern "C"
{
	int DlinaStroki(char *s);
}

/*
int DlinaStroki(char *s)
{
	int n = 0;

	while (*s)
	{
		s++;
		n++;
	}

	return n;
}
*/

char *CopyStr(char *s1, char *s2, int L)
{
	while (L > 0)
	{
		*s2 = *s1;

		s1++;
		s2++;
		L--;
	}

	return s2;
}


int _tmain(int argc, _TCHAR* argv[])
{
	char str1[] = "Hello world!";
	char str2[] = "____________";

	int len = DlinaStroki(str1);

	cout << len;

	//CopyStr(str1, str2, 4);

	getchar();
	return 0;
}

