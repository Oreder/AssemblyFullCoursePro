int _cdecl fact(int num, int * res)
{
	int r = 1;
	if(num == 1) 
	{
		*res = 1;
		return;
	}

	fact(num - 1, &r);
	*res = num * r;
}