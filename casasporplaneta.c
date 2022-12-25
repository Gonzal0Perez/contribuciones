#include <stdio.h>
#include <stdlib.h>
#include <math.h>
double positions[10]={121.54986241, 173.74914574, 133.80428291, 111.71850198, 178.81234154, 19.09505726, 321.14080712, 153.52621070, 222.88895044, 160.53177399};
char planets[10][10]={{'S','O','L',0},{'L','U','N','A',0},{'M','E','R','C','U','R','I','O',0},{'V','E','N','U','S',0},{'M','A','R','T','E',0},{'J','U','P','I','T','E','R',0}, {'S','A','T','U','R','N','O',0}, {'U','R','A','N','O',0}, {'N','E','P','T','U','N','O'}, {'P','L','U','T','O',0}};

double ascendente=191.64982045;
char casas_nombre[38]={'I',0,'I','I',0,'I','I','I',0,'I','V',0,'V', 0,'V','I',0,'V','I','I',0,'V','I','I','I',0,'I','X',0,'X',0,'X','I',0, 'X','I','I', 0};
unsigned char i=0;
unsigned char j=0;
unsigned char k=0;
unsigned char l=0;
unsigned char m=0;
unsigned char n=0;

int main(int argc, char *argv[]) {
  fprintf(stdout, "int main( int argc, char *argv[] ) {\n");
  i=0;
  printf("char casasporplaneta[%ld][2][%ld]={", sizeof(planets)/sizeof(planets[0]), sizeof(planets[0]));
  while (i<sizeof(positions)/sizeof(double)) {
    j=0;
    k=0;
    while (j<12) {
      if(j==0) k=12;
      if(fmod(ascendente+(30*k), 360)>positions[i] && fmod(ascendente+(30*k), 360)<positions[i]) {
	printf("{\"");
	l=0;
	while(l<sizeof(planets)/sizeof(planets[0]) && planets[i][l]!=0) {
	  printf("%c", planets[i][l]);
	  l++;
	}
	printf("\", \"");
	n=1;
	l=0;
	m=0;
	while(l<j) {
	  while(casas_nombre[m]!=0) m++;
	  m++;
	  l++;
	}
	while(casas_nombre[m]!=0) {
	  printf("%c", casas_nombre[m]);
	  m=m+1;
	  fflush(stdout);
	}
	printf("\"}");
      }
      k=j;
      j++;
    }
    if(n && i<(sizeof(positions)/sizeof(double))-1) printf(",");
    n=0;
    i++;
  }
  printf("};\n};");
  return  0;
}
