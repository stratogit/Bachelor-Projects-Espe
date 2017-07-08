#include<conio.h>
#include<dos.h>
#include<stdio.h>
#include <string.h>

void hora(REGS reg);
void animacion0(void);
void animacion1(void);
void animacion2(void);
void animacion3(void);
void animacion4(void);
void animacion5(void);
void animacion6(void);
void animacion7(void);
void animacion8(void);
void animacion9(void);
void init(void);
void write(char char2write);
void putch(char char2write);
void puts(char * str2write);
void l_goto(int row, int column);
void clear(void);
void home(void);
void cursor(int cursor);
void entrymode(int mode);


int min;
int hora1;
int dato;
int puertdato=0x378;
int puertcont=0x37a;
int puertesta=0x379;
int vlen=700;
int vmed=500;
int vrap=50;
int vact=1;
int dlcd=5;
int v=vrap;
int b1,b2,c,a0=1,a1=1,a2=1,a3=1,a4=1,a5=1,a6=1,a7=1,a8=1,a9=1,d=0,efe=0;
char data[15];
char datoi[15];
void main()
{
clrscr();

init();
cursor(0);
clear();

union REGS reg;
printf(" MICROPROCESADORES Y ARQUITECTURA DEL PC\n\n");
printf(" Gracia , Leon, Villacres \n\n");
do{
hora(reg);
char data[15];
dato=inportb(puertesta);
dato=dato-192;
dato=dato/8;
if (dato <= -1){
 dato=dato*-1/2;
}
printf("\n tecla(0-15): %2d \n",dato);

if (dato==0)
{
 a0=1;
 animacion0();

 dato=inportb(puertesta);
 dato=dato-192;
 dato=dato/8;
if (dato<=-1){
dato=dato*-1;
}
 if (dato==0){
 b1=1;
 }
   printf("\n tecla(0-15): %2d \n",dato);

}

if (dato==1 || b1==1)
{
 animacion1();
 a1=1;
 dato=inportb(puertesta);

	dato=dato-192;
	dato=dato/8;
	if (dato<=-1){
 dato=dato*-1;
 }
 if (dato==1){
   b1=2;
 }
  printf("\n tecla(0-15): %2d \n",dato);

}

if (dato==2 | b1==2)
{
 animacion2();
 a2=1;
 dato=inportb(puertesta);
 dato=dato-192;
 dato=dato/8;
 if (dato<=-1){
 dato=dato*-1;
 }

 if (dato==2){
   b1=3;
 }
   printf("\n tecla(0-15): %2d \n",dato);
}

if (dato==3 | b1==3)
{
 animacion3();
 a3=1;
 dato=inportb(puertesta);
 dato=dato-192;
 dato=dato/8;
 if (dato<=-1){
 dato=dato*-1;
 }
 if (dato==3){
   b1=4;
 }else{
   printf("\n tecla(0-15): %2d \n",dato);
 }
}

if (dato==4 | b1==4)
{
 animacion4();
 a4=1;
 dato=inportb(puertesta);
  dato=dato-192;
 dato=dato/8;
 if (dato<=-1){
 dato=dato*-1;
 }

  if (dato==4){
   b1=5;
 }
   printf("\n tecla(0-15): %2d \n",dato);
}

if (dato==5 | b1==5)
{
 animacion5();
 a5=1;
 dato=inportb(puertesta);
 dato=dato-192;
 dato=dato/8;
 if (dato<=-1){
 dato=dato*-1;
 }

 if (dato==5){
   b1=6;
 }
   printf("\n tecla(0-15): %2d \n",dato);
}

if (dato==6 | b1==6)
{
 animacion6();
 a6=1;
 dato=inportb(puertesta);
 dato=dato-192;
 dato=dato/8;
 if (dato<=-1){
 dato=dato/-1;
 }

 if (dato==6){
   b1=7;
 }
   printf("\n tecla(0-15): %2d \n",dato);
}

if (dato==7 | b1==7)
{
 animacion7();
 a7=1;
 dato=inportb(puertesta);
 dato=dato-192;
 dato=dato/8;
 if (dato<=-1){
 dato=dato/-2;
 }

 if (dato==7){
   b1=8;
 }
   printf("\n tecla(0-15): %2d \n",dato);
 
}

if (dato==8 | b1==8)
{
 animacion8();
 a8=1;
 dato=inportb(puertesta);
 dato=dato-192;
 dato=dato/8;
 if (dato <= -1){
 dato=dato*-1;
 }
   if (dato==8){
   b1=9;
   printf("\n tecla(0-15): %2d \n",dato);
  }
}

if (dato==9 | b1==9)
{
 animacion9();
 a9=1;
 dato=15;
}

// velocidades de despliegue
if (dato==10){
   v=vlen;
   vact=1;
}
if (dato==11){
   v=vmed;
   vact=2;
}
if (dato==12){
   v=vrap;
   vact=3;
}
if (dato==13 && b1!=10){
    FILE *archivo;
    archivo= fopen("archpro.txt", "a");
    if (archivo== NULL)
    {
       fprintf(stderr, "No se puede abrir el archivo\n");
    }else{
       sprintf(datoi,"A=%d V=%d - %2d:%2d \n",efe,vact,hora1,min);
       int i;
       for(i=0;i<=29;i++){
       putc(datoi[i],archivo);
       }
       fclose(archivo);
       printf("\nArchivo guardado\n");   }
    b1=10;
}
//Leo desde el archivo
if (dato==14&& b1!=11){
    FILE *archivo;
    archivo= fopen("archpro.txt", "r");
    if (archivo== NULL)
    {
       fprintf(stderr, "No existen datos anteriores\n");
    }else{
       char letra[154];
       int i;
       for(i=0;i<=153;i++){
	  letra[i]=getc(archivo);
	  printf("%c",letra[i]);
       }
       fclose(archivo);
    }
    b1=11;
}

}while(dato<=14 && dato>0);
getch();
}
/*LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-
LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD-LCD- */
// inicia lcd

void init()
{
outportb(puertcont, inportb(puertcont) & 0xDF);
outportb(puertcont, inportb(puertcont) | 0x08);
write(0x0f);
delay(20);
write( 0x01);
delay(20);
write( 0x38);
delay(20);

}

void write(char char2write)
{
outportb(puertesta, char2write);
outportb(puertcont, 0x01); /* Set Strobe */
delay(20);
outportb(puertcont, 0xFE); /* Reset Strobe */
delay(20);

}

void putch(char char2write)
{
outportb(puertcont, inportb(puertcont) & 0xF7);
write(char2write);
}

void puts(char *str2write)
{
outportb(puertcont, inportb(puertcont) & 0xF7);
while(*str2write)
    write(*(str2write++));
}

void l_goto(int row, int column)
{

outportb(puertcont, inportb(puertcont) | 0x08);
if(row==2) column+=0x40;
 write(0x80 | column);

}

void clear()
{
outportb(puertcont, inportb(puertcont) | 0x08);
write(0x01);
}

void home()
{
outportb(puertcont, inportb(puertcont) | 0x08);
write(0x02);
}

void entrymode(int mode)
{
outportb(puertcont, inportb(puertcont) | 0x08);
write(0x04 + (mode%4));
}

void cursor(int cursor)
{
outportb( puertcont, inportb(puertcont) | 0x08 );
write( 0x0c + (cursor%4));
}
//imprimir la hora
void hora(REGS reg)
{
	reg.h.ah=0x2c;
	int86(0x21,&reg,&reg);
	hora1=reg.h.ch;
	min=reg.h.cl;
	printf("hora: %2d : %2d",hora1,min);
	char hora2[8];
	sprintf(hora2,"%2d:%02d",hora1,min);
	outportb(puertcont,13);
	delay(dlcd);
	l_goto(1,2);
	puts(hora2);
}

/*animaciones-animaciones-animaciones-animaciones-animaciones-animaciones-animaciones-animaciones-animaciones-animaciones-animaciones-animaciones-*/
//animacion 0**************************************************
// -----------> a ala vez <-----------
void animacion0(){
	a0=1;
	efe=0;
	int d=0;
	do{
	++d;
	printf("animacion 0 : %d \n",a0);
	a0=a0++;
	b1=1;
	b2=256;
	for(c=0;c<=8;++c)
	{
		outportb(puertcont,14);
		outportb(puertdato,b1);
		b1=b1*2;
		delay(v);

		outportb(puertcont,8);
		outportb(puertdato,b2);
		b2=b2/2;
		delay(v);
	}

	sprintf(data,"A=%d V=%d R=%d",efe,vact,a0);
	outportb(puertcont,13);
	delay(dlcd);
	l_goto(2,1);
	puts(data);
	}while(d!=9);
}

//animacion 1*****************************************************
//auto fantastico
void animacion1(){
 efe=1;
 d=0;
 do{
 printf("animacion 1 : %d \n ",a1);
  a1=a1++;
  ++d;
 b1=1;
 for(c=0;c<=8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);
  }
 b1=1;
 for(c=0;c<=8;++c)
  {
	outportb(puertcont,8);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);

 }
 b1=256;
 for(c=0;c<=8;++c)
  {
	outportb(puertcont,8);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);
 }
 b1=256;
 for(c=0;c<8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);
  }
	sprintf(data,"A=%d V=%d R=%d",efe,vact,a1);
	outportb(puertcont,5);
	delay(dlcd);
	l_goto(2,1);
	puts(data);
 }while(d!=9);
}

//animacion 2******************************************************
//primero ----------> despues <----------
void animacion2(){
 efe=2;
 d=0;
 do{
 printf("animacion 2: %d \n",a2);
 a2=a2++;
 ++d;
 b1=1;
 for(c=0;c<=8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);
 }
 b2=256;
 for(c=0;c<=8;++c)
  {

	outportb(puertcont,8);
	outportb(puertdato,b1);
	b2=b2/2;
	delay(v);

 }
 sprintf(data,"A=%d V=%d R=%d",efe,vact,a2);
	outportb(puertcont,5);
	delay(dlcd);
	l_goto(2,1);
	puts(data);
 }while(d!=9);
}

//animacion 3*********************
//primero <---------- despues---------->
void animacion3(){
 efe=3;
 d=0;
 do{
 printf("animacion 3: %d \n",a3);
 a3=a3++;
 ++d;
 b1=256;
 for(c=0;c<=8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);
 }
 b2=1;
 for(c=0;c<=8;++c)
  {
	outportb(puertcont,8);
	outportb(puertdato,b1);
	b2=b2*2;
	delay(v);

 }
	sprintf(data,"A=%d   V=%d   R=%d",efe,vact,a3);
	outportb(puertcont,5);
	delay(dlcd);
l_goto(2,1);
	puts(data);
 }while(d!=9);
}

//animacion 4**********************
//BLINKING
void animacion4(){
 efe=4;
 d=0;
 do{
 printf("animacion 4 : %d \n",a4);
 a4=a4++;
 ++d;
 b1=255;

	outportb(puertcont,10);
	outportb(puertdato,b1);
	delay(v);
	outportb(puertdato,0);
	delay(v);

	sprintf(data,"A=%d V=%d R=%d",efe,vact,a4);
	outportb(puertcont,5);
	delay(dlcd);
	l_goto(2,1);
	puts(data);
 }while(d!=9);
}

//animacion 5**************************
//<------------ a la vez -------------->
void animacion5(){
 efe=5;
 d=0;
 do{
 ++d;
 printf("animacion 5: %d \n",a5);
 a5=a5++;
 b1=256;
 b2=1;
 for(c=0;c<=8;++c)
 {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);

	outportb(puertcont,8);
	outportb(puertdato,b2);
	b2=b2*2;
	delay(v);
	outportb(0x37a,5);
 }
	sprintf(data,"A=%d V=%d R=%d",efe,vact,a5);
	outportb(puertcont,5);
	delay(dlcd);
l_goto(2,1);
	puts(data);
 }while(d!=9);
}

//animacion 6************************************************
//a la vez
//-----------> <------------
// <--------- -------------->
void animacion6(){
 efe=6;
 d=0;
 do{
 ++d;
 printf("animacion 6: %d \n ",a6);
 a6=a6++;
 b1=1;
 b2=256;
 for(c=0;c<8;++c)
  {
	outportb(puertcont,6);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);

	outportb(puertcont,0);
	outportb(puertdato,b2);
	b2=b2/2;
	delay(v);
	outportb(0x37a,5);
 }
 b1=256;
 b2=1;
 for(c=0;c<8;++c)
  {


	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);

	outportb(puertcont,8);
	outportb(puertdato,b2);
	b2=b2*2;
	delay(v);
	outportb(0x37a,5);
 }
 sprintf(data,"A=%d V=%d R=%d",efe,vact,a6);
	outportb(puertcont,5);
	delay(dlcd);
	l_goto(2,1);
	puts(data);

 }while(d!=9);
}

//animacion 7**************************
// rota hacia derecha y
//a la vez
//-----------> <------------
void animacion7(){
 efe=7;
 d=0;
 do{
 ++d;
 printf("animacion 7 : %d \n",a7);
 a7=a7++;
 b1=1;
 for(c=0;c<=8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);
 }
 b1=1;
 for(c=0;c<8;++c)
  {
	outportb(puertcont,8);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);
 }
 b1=1;
 b2=256;
 for(c=0;c<8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);

	outportb(puertcont,8);
	outportb(puertdato,b2);
	b2=b2/2;
	delay(v);
	outportb(0x37a,5);
 }

 for(c=0;c<8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);

	outportb(puertcont,8);
	outportb(puertdato,b2);
	b2=b2*2;
	delay(v);
	outportb(0x37a,5);
 }
	sprintf(data,"A=%d V=%d R=%d",efe,vact,a7);
	outportb(puertcont,5);
	delay(dlcd);
	l_goto(2,1);
	puts(data);

 }while(d!=9);
}

//animacion 8**************************
// rota a la izquierda y
//a la vez
// <--------- -------------->
void animacion8()
{ efe=8;
 d=0;
 do{
 ++d;
 printf("animacion 8: %d \n",a8);
 a8=a8++;
 b1=256;
 for(c=0;c<8;++c)
  {

	outportb(puertcont,8);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);

 }
 b1=256;
 for(c=0;c<8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);
 }

 b1=256;
 b2=1;
 for(c=0;c<8;++c)
  {
	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);

	outportb(puertcont,8);
	outportb(puertdato,b2);
	b2=b2*2;
	delay(v);

 }
	sprintf(data,"A=%d V=%d R=%d",efe,vact,a1);
	outportb(puertcont,5);
	delay(dlcd);
	l_goto(2,1);
	puts(data);
 }while(d!=9);
}

//animacion 9**************************
//a la vez
//-----------> <------------
// <--------- -------------->
void animacion9(){
 efe=9;
 d=0;
 do{
 ++d;
 printf("animacion 9 : %d \n",a9);
 a9=a9++;
 b1=5;
 b2=160;
 for(c=0;c<8;++c)
  {


	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1*2;
	delay(v);

	outportb(puertcont,8);
	outportb(puertdato,b2);
	b2=b2/2;
	delay(v);
	outportb(0x37a,5);
 }
 b1=160;
 b2=5;
 for(c=0;c<8;++c)
  {


	outportb(puertcont,14);
	outportb(puertdato,b1);
	b1=b1/2;
	delay(v);

	outportb(puertcont,8);
	outportb(puertdato,b2);
	b2=b2*2;
	delay(v);
	outportb(0x37a,5);
 }
 sprintf(data,"A=%d   V=%d   R=%d",efe,vact,a1);
	outportb(puertcont,5);
	delay(dlcd);
       l_goto(2,1);
	puts(data);
 }while(d!=9);
}
