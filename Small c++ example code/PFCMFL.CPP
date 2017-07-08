# include <stdio.h>
# include <conio.h>

void main()

{

clrscr();

char z;
int a,b,c,d,e=0,f=1,j=1,k;

 printf("\t\t\t ESCUELA POLITECNICA DEL EJERCITO\n");
 printf("\t\t\t ELECTRONICA Y TELECOMUNICACIONES \n");
 printf("\t Curso: 2A \n");
 printf("\t Nombre: Felipe Leon \n\n\n");

 printf("Menu de Opciones \n");
 printf("   1. El factorial de un numero \n");
 printf("   2. Comprobar si un numero es primo \n");
 printf("   3. Dibujar una figura \n");
 printf("\n ESCOJA LA OPCION: ");
 z=getchar();
 fflush(stdin);
  switch(z)

  {

   case'1':

    {
    clrscr();
    printf("\n Ingrese un numero:  ");
    scanf("%d",&a);
     for(j=1;j<=a;j++)
      {
      f=f*j;
      }
      printf("\n El factorial del numero es: %d",f);

    break;
    }

   case'2':

    {
    clrscr();
    printf("\n Ingrese un numero: ");
    scanf("%d",&b);
     for(d=2;d<=b;d++)
      {
      c=b%d;
       if(c==0)
       e++;
      }
       if(e==1)
	printf("El numero es primo");
       else
	printf("El numero no es primo");
    break;
    }

    case'3':

     {
     clrscr();
     printf("\n ******* \n");
     printf("\n *     * \n");
     printf("\n *     * \n");
     printf("\n *     * \n");
     printf("\n *     * \n");
     printf("\n *     * \n");
     printf("\n ******* \n");
     break;
     }

    default:
    printf("inserte una opcion correcta vuelva a iniciar el programa");

  }

 getch();

}