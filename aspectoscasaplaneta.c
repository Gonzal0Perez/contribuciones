#include <stdio.h>
#include <math.h>
int main(int argc, char *argv[]) {
  double positions[10]={121.54986241, 173.74914574, 133.80428291, 111.71850198, 178.81234154, 19.09505726, 321.14080712, 153.52621070, 222.88895044, 160.53177399};
  double ascendente=29.00;
  char planets[10][10]={{'S','O','L',0},{'L','U','N','A',0},{'M','E','R','C','U','R','I','O',0},{'V','E','N','U','S',0},{'M','A','R','T','E',0},{'J','U','P','I','T','E','R',0}, {'S','A','T','U','R','N','O',0}, {'U','R','A','N','O',0}, {'N','E','P','T','U','N','O'}, {'P','L','U','T','O',0}};
  char casas_nombre[38]={'I',0,'I','I',0,'I','I','I',0,'I','V',0,'V', 0,'V','I',0,'V','I','I',0,'V','I','I','I',0,'I','X',0,'X',0,'X','I',0, 'X','I','I', 0};
  double aspects[6]={0,  15, 60, 90, 120, 180};
  double toleranc[6]={7, 3, 7, 7, 7};
  double resta;
  int indices[100][2];
  double aspectsi[100];
  double gradosi[100];
  int ip=0;
  int iq=0;
  int p2=0;  
  int p=0;
  int l=sizeof(positions)/sizeof(double);
  int m=0;
  while(p<10) {
    planets[p][sizeof(planets[0])-1]=0;
    p++;
  }
  p=0;  
  while(p<l) {
    p2=0;
    while(p2<12) {
      ip=0;
      if(ascendente+(30*p2)>360) resta=fmod(positions[p]+(ascendente+(30*p2)), 360);
      while(ip<sizeof(aspects)/sizeof(double)) {
	resta=fmod(positions[p]+aspects[ip], 360);
	if(resta >= (ascendente+(30*p2))-(toleranc[ip]/2) && resta <= (ascendente+(30*p2))+(toleranc[ip]/2) ) {
	  indices[iq][0]=p;
	  indices[iq][1]=p2;
	  aspectsi[iq]=aspects[ip];
	  gradosi[iq]=fabs(resta-(ascendente*p2));
	  iq++;
	}
	fflush(stdout);
	ip++;
      }
      p2++;
    }
    p++;
  }
  fprintf(stdout, "#include <stdio.h>\n");
  fprintf(stdout, "int main( int argc, char *argv[] ) {\n");
  ip=0;
  printf("char planet_names[%ld][%ld]={", sizeof(planets)/sizeof(planets[0]), sizeof(planets[0]));
  while(ip<sizeof(planets)/sizeof(planets[0])) {
    l=0;
    printf("{");
    while(l<sizeof(planets[0])&& planets[ip][l]!=0) {
      printf("'%c',", planets[ip][l]);
      l++;
    }
    printf("0}");
    if(ip<sizeof(planets)/sizeof(planets[0])-1) printf(",");
    ip++;
  }
  printf("};\n");
  fprintf(stdout, "char planets[%d][2][10]={", iq);
  ip=0;
  while(ip<iq) {
    printf("{{");
    l=0;
    while(l<sizeof(planets[indices[ip][0]])) {
      if(planets[indices[ip][0]][l]==0) break;
      printf("'%c',", planets[indices[ip][0]][l]);
      l++;
    }
    printf("0}, {");
    // . . . . . . .
    l=0;
    p2=0;
    printf("/*%d*/", indices[ip][1]);
    while(l<sizeof(casas_nombre)) {
      if(casas_nombre[l]==0) p2++;
      if(indices[ip][1]==p2) {
	l++;
	while(casas_nombre[l]!=0 && l<sizeof(casas_nombre)) {
	  printf("'%c',", casas_nombre[l]);
	  l++;
	}
	break;
      }
      l++;
    }
    printf("0}}");
    ip++;
    if(ip<iq) printf(",");
  }
  printf("};\n");
  fprintf(stdout, "char aspects[%d]={", iq);
  ip=0;
  while(ip<iq) {
    printf("%d", (int)aspectsi[ip]);
    ip++;
    if(ip<iq) printf(",");
  }
  printf("};\n");
  fprintf(stdout, "double grados[%d]={", iq);
  ip=0;
  while(ip<iq) {
    printf("%03.1f", gradosi[ip]);
    ip++;
    if(ip<iq) printf(",");
  }
  printf("};\n");
  printf("};\n");
  return 0;
}
