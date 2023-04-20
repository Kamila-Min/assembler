void decode1(int *xp, int *yp, int *zp)
{
int ebx, esi, eax;
ebx = *yp;
esi = *zp;
eax = *xp;
*yp = eax;
*zp = ebx;
*xp = esi;
}
