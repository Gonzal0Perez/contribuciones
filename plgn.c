#include <stdio.h>
#include <math.h>

char zodiacogradosigno[12][12]={"Aries", "Tauro", "Geminis", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagitario", "Capricornio", "Acuario", "Piscis"};
int zgs_i=0;
double planetas[10];
char ascencional_planet_names[10][10]={{'S','O','L',0},{'L','U','N','A',0},{'M','E','R','C','U','R','I','O',0},{'V','E','N','U','S',0},{'M','A','R','T','E',0},{'J','U','P','I','T','E','R',0},{'S','A','T','U','R','N','O',0},{'U','R','A','N','O',0},{'N','E','P','T','U','N','O',0},{'P','L','U','T','O',0}};
double planetas_ascencional[10]={0.17410906,162.60551804,348.47094449,357.18769526,63.68681241,59.65200111,284.24921901,275.80273485,283.35464838,227.26281228};
unsigned char ps[100];
unsigned char psind=0;
char ascencional_planets[13][2][10]={{{'S','O','L',0}, {'J','U','P','I','T','E','R',0}},{{'L','U','N','A',0}, {'M','E','R','C','U','R','I','O',0}},{{'L','U','N','A',0}, {'S','A','T','U','R','N','O',0}},{{'L','U','N','A',0}, {'U','R','A','N','O',0}},{{'L','U','N','A',0}, {'N','E','P','T','U','N','O',0}},{{'M','E','R','C','U','R','I','O',0}, {'L','U','N','A',0}},{{'V','E','N','U','S',0}, {'J','U','P','I','T','E','R',0}},{{'M','A','R','T','E',0}, {'J','U','P','I','T','E','R',0}},{{'J','U','P','I','T','E','R',0}, {'M','A','R','T','E',0}},{{'S','A','T','U','R','N','O',0}, {'N','E','P','T','U','N','O',0}},{{'U','R','A','N','O',0}, {'S','O','L',0}},{{'N','E','P','T','U','N','O',0}, {'S','A','T','U','R','N','O',0}},{{'P','L','U','T','O',0}, {'M','E','R','C','U','R','I','O',0}}};
unsigned char aspects[13]={0,0,0,0,0,0,0,0,0,0,0,0,0};
char planetas_simbolo[11][13]={ {'s','o','l','.','p','n','g',0}, {'l','u','n','a','.','p','n','g',0}, {'m','e','r','c','u','r','i','o','.','p','n','g',0}, {'v','e','n','u','s','.','p','n','g',0}, {'m','a','r','t','e','.','p','n','g',0}, {'j','u','p','i','t','e','r','.','p','n','g',0}, {'s','a','t','u','r','n','o','.','p','n','g',0}, {'u','r','a','n','o','.','p','n','g',0}, {'n','e','p','t','u','n','o','.','p','n','g',0}, {'p','l','u','t','o','n','.','p','n','g',0}, "nodo.png" };
char aspectos_simbolo[6][15]={ {'c','o','n','j','u','n','c','i','o','n','.','p','n','g',0}, {'s','e','x','t','i','l','.','p','n','g',0}, {'c','u','a','d','r','a','t','u','r','a','.','p','n','g',0}, {'t','r','i','g','o','n','o','.','p','n','g',0}, {'o','p','o','s','i','c','i','o','n','.','p','n','g',0}, {'c', 'u', 'a', 'd', 'r', 'o', '.', 'p', 'n', 'g', 0} };
char color_as[7]={0,0,0,0,0,0,0};
double positions[10][2];
unsigned char z=0;
unsigned char p=0;
unsigned char q=0;
double posab[2][2];
double gradosab[2];
double test=0;
unsigned char indiceaspecto=0;
unsigned char indicezodiaco=0;
double gradossigno=0;
double gradostmp=0;
double  minutossigno=0;
double  segundossigno=0;
double radius=550;
double distance=750;
double radius2=300;
double radius3=300;
double grados=0;
double grados2=0;
double ASC=35;
double a=(M_PI * 2)/360;
double x=0;
double y=0;
int xp=0;
int yp=0;
double xx=0;
double yy=0;
double dif=1.30;
char output[10]={' ',0};
char path[12]={'/','r','o','o','t','/','n','u','b','e',0};
double varios=1.00;
int main( int argc, char *argv[] ) {
  radius2=radius/dif;
  radius3=radius*1.31;
  z=0;
  while(z<11) {
    planetas[z]=planetas_ascencional[z];
    z++;
  }
  z=0;
  while(z<100) {
    ps[z]=255;
    z++;
  }
  z=0;
  while(z<11) {
    p=0;
    while(p<11) {
      if(fabs(planetas[z]-planetas[p])<1.3 && z!=p) {
	planetas[p]=planetas[p]-0.9;
	planetas[z]=planetas[z]+0.9;
	z=-1;
	p=100;
      }
      p++;
    }
    z++;
  }
  printf("convert -gravity center \\( %s/cuadro.png -scale 1500x1500 \\)  \\( %s/circulozodiaco_signos.png -scale 1500x1500 \\)  -compose over -composite \\( %s/circle2.png -distort SRT -%03.4f \\) -compose over -composite", path, path, path, ASC); //circulocasas_n4

  // - . - . - . - . - . - . - . - . - . - . - . - . - . - 
    grados=ASC;
    grados2=grados;
    if(grados2>90) {
      if(grados>90 && grados<270) grados2=fmod(grados, 90);
      if(grados<=180) grados2=90-grados2;
      else grados2=grados2-(grados2*2);
    } else {
      grados2=grados2-(grados2*2);
    }
    grados=ASC;
    x=ceil((radius-200) * sin(a*(grados+270)));
    y=ceil((radius-200) * cos(a*(grados+270)));
    zgs_i=0;
    while((zgs_i*30)<360) {
      if(grados>(zgs_i*30) && grados<(zgs_i*30)+30) {
	indicezodiaco=zgs_i;
	gradossigno=grados-zgs_i*30;
	gradossigno=trunc(gradossigno);
	gradostmp=(grados-((zgs_i*30)+gradossigno))*100;
	minutossigno=(((gradostmp)*60)/100);
	gradostmp=(gradostmp-trunc(gradostmp))*100;
	segundossigno=(((gradostmp)*60)/100);
	break;
      }
      zgs_i++;
    }

    if(ASC<90 || (ASC>180 && ASC <270)) grados=grados2;
    else grados=grados2-180;
    printf(" -pointsize 17 -font URW-Gothic-Book \\( -gravity center -background none caption:\"(%s)%s,%03.f°%02.f\'%02.f\'\'\"   -geometry +%04.f+%04.f   -rotate %02.f \\) -compose over -composite -pointsize 20 ", "ASC", zodiacogradosigno[indicezodiaco], gradossigno, minutossigno, segundossigno,round(x), round(y), grados); //*%03.3f-%03.3f*/
    // * * * * * * * * * * * * * * * * * * * *
    
  z=0;
  while(z<11) {
    grados=planetas_ascencional[z];
    grados2=10;
    grados2=grados;
    if(grados2>90) {
      while(grados2>90 && grados<270) grados2-=90;
      if(grados<=180) grados2=90-grados2;
      else grados2=grados2-(grados2*2);
    } else {
      grados2=grados2-(grados2*2);
    }
    grados=planetas[z];
    x=ceil(radius2 * sin(a*(grados+270)));
    y=ceil(radius2 * cos(a*(grados+270)));
    positions[z][0]=x+distance+(M_PI);
    positions[z][1]=y+distance+(M_PI*2);
    x=ceil(radius * sin(a*(grados+270)));
    y=ceil(radius * cos(a*(grados+270)));
    grados=planetas_ascencional[z];
    xx=ceil(radius3 * sin(a*(grados+270)));
    yy=ceil(radius3 * cos(a*(grados+270)));
    zgs_i=0;
    while((zgs_i*30)<360) {
      if(grados>(zgs_i*30) && grados<(zgs_i*30)+30) {
	indicezodiaco=zgs_i;
	gradossigno=grados-zgs_i*30;
	gradossigno=trunc(gradossigno);
	gradostmp=(grados-((zgs_i*30)+gradossigno))*100;
	minutossigno=(((gradostmp)*60)/100);
	gradostmp=(gradostmp-trunc(gradostmp))*100;
	segundossigno=(((gradostmp)*60)/100);
	break;
      }
      zgs_i++;
    }
    printf(" \\( -gravity center %s/%s -scale 35x35 -geometry +%04.f+%04.f -rotate -%04.4f \\) -compose over -composite ", path, planetas_simbolo[z], xx, yy, ASC);
    grados=grados-ASC;
    if(grados<0) grados=360+grados;
    if((grados>150) ||  (grados<90) ) grados2=grados2-180;
    printf(" \\( -gravity center -background none caption:\"(%s)%s,%03.f°%02.f\'%02.f\'\'\"   -geometry +%04.f+%04.f  -rotate %02.f \\) -compose over -composite ", ascencional_planet_names[z], zodiacogradosigno[indicezodiaco], gradossigno, minutossigno, segundossigno,round(x), round(y), grados2);
    z++;
    
  }
  z=0;
  while(z<sizeof(aspects)) {
    p=0;
    q=0;
    psind=0;
    while(p<11) {
      if( (ascencional_planets[z][0][0] == ascencional_planet_names[p][0] && ascencional_planets[z][0][1] == ascencional_planet_names[p][1] && ascencional_planets[z][0][2] == ascencional_planet_names[p][2]) || (ascencional_planets[z][1][0] == ascencional_planet_names[p][0] && ascencional_planets[z][1][1] == ascencional_planet_names[p][1] && ascencional_planets[z][1][2] == ascencional_planet_names[p][2]) ) {
	posab[q][0]=positions[p][0];
	posab[q][1]=positions[p][1];
	gradosab[q]=planetas_ascencional[p];
	if(q==0) psind=p*10;
	if(q==1) {
	  psind=psind+p;
	  break;
	}
	q++;
	if(q==2) break;
      }
      p++;
    }
    if(ps[psind]!=255) {
      z++;
      continue;
    }
    ps[psind]=p;
    indiceaspecto=5;
    if(aspects[z] ==0) indiceaspecto=0;
    if(aspects[z] ==60) indiceaspecto=1;
    if(aspects[z] ==90) indiceaspecto=2;
    if(aspects[z] ==120) indiceaspecto=3;
    if(aspects[z] ==180) indiceaspecto=4;
      color_as[0]='b';
      color_as[1]='l';
      color_as[2]='a';
      color_as[3]='c';
      color_as[4]='k';
      color_as[5]=0;
      if(aspects[z] == (unsigned char)0 ) {
      color_as[0]='b';
      color_as[1]='l';
      color_as[2]='u';
      color_as[3]='e';
      color_as[4]=0;
    }
      if(aspects[z] == (unsigned char)15 ) {
      color_as[0]='p';
      color_as[1]='i';
      color_as[2]='n';
      color_as[3]='k';
      color_as[4]=0;
    }
      if(aspects[z] == (unsigned char)30 ) {
      color_as[0]='g';
      color_as[1]='r';
      color_as[2]='e';
      color_as[3]='e';
      color_as[4]='n';
      color_as[5]=0;
    }
      if(aspects[z] == (unsigned char)45 ) {
      color_as[0]='p';
      color_as[1]='i';
      color_as[2]='n';
      color_as[3]='k';
      color_as[4]=0;
    }
      if(aspects[z] == (unsigned char)60 ) {
      color_as[0]='b';
      color_as[1]='l';
      color_as[2]='u';
      color_as[3]='e';
      color_as[4]=0;
    };
      if(aspects[z] == (unsigned char)75 ) {
      color_as[0]='p';
      color_as[1]='i';
      color_as[2]='n';
      color_as[3]='k';
      color_as[4]=0;
    }
      if(aspects[z] == (unsigned char)90 ) {
      color_as[0]='r';
      color_as[1]='e';
      color_as[2]='d';
      color_as[3]=0;
      color_as[4]=0;
    }
      if(aspects[z] == (unsigned char)105 ) {
      color_as[0]='g';
      color_as[1]='r';
      color_as[2]='e';
      color_as[3]='e';
      color_as[4]='n';
      color_as[5]=0;
    }
      if(aspects[z] == (unsigned char)120 ) {
      color_as[0]='b';
      color_as[1]='l';
      color_as[2]='u';
      color_as[3]='e';
      color_as[4]=0;
    };
      if(aspects[z] == (unsigned char)135 ) {
      color_as[0]='p';
      color_as[1]='i';
      color_as[2]='n';
      color_as[3]='k';
      color_as[4]=0;
    }
      if(aspects[z] == (unsigned char)150 ) {
      color_as[0]='g';
      color_as[1]='r';
      color_as[2]='e';
      color_as[3]='e';
      color_as[4]='n';
      color_as[5]=0;
    }
      if(aspects[z] == (unsigned char)165 ) {
      color_as[0]='p';
      color_as[1]='i';
      color_as[2]='n';
      color_as[3]='k';
      color_as[4]=0;
    }
      if(aspects[z] == (unsigned char)180) {
      color_as[0]='r';
      color_as[1]='e';
      color_as[2]='d';
      color_as[3]=0;
      color_as[4]=0;
    }
      test=fmod(fabs(gradosab[0]-gradosab[1]), 180);
    printf(" -gravity NorthWest  -stroke %s -strokewidth 2  -draw \"line %03.2f,%03.2f %03.2f,%03.2f \"", color_as, posab[0][0], posab[0][1], posab[1][0], posab[1][1]);
    if(varios>1.2) varios=1;
    x=posab[0][0]-(posab[0][0]-posab[1][0])/(2*varios);
    y=posab[0][1]-(posab[0][1]-posab[1][1])/(2*varios);
    varios+=0.03;
    printf(" \\( -gravity NorthWest %s/%s -scale 40x40 -geometry +%04.f+%04.f -rotate -%04.4f \\) -compose over -composite ", path, aspectos_simbolo[indiceaspecto], x, y, ASC ); //+(posab[0][0]-posab[1][0])
    printf(" \\(  -stroke %s -gravity NorthWest -background none  caption:\"%03.2f\"   -geometry +%04.f+%04.f -rotate -%04.4f \\) -compose over -composite ", color_as, test, x, y, ASC); // /*%03.3f-%03.3f*/
    //    printf(" \\( -fill white -stroke %s -gravity NorthWest -background none -font URWGothic-Book -pointsize 22 -annotate +%04.f+%04.f  \"%03.1f\" \\) ", color_as, x, y, /*gradosab[0], gradosab[1]*/ test); // /*%03.3f-%03.3f*/
    z++;
  }
  printf(" -background green -gravity center  -distort SRT %03.4f  -sampling-factor 4:2:0  -strip -interlace Plane -define jpeg:dct-method=float  -quality 70 -colorspace RGB %s.jpg \n convert %s.jpg -scale 600x600 %s.gif", ASC, output, output, output);
}
