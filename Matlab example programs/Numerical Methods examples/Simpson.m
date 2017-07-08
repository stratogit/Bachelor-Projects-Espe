clear all;
clc;
close all;
fprintf('\tPrograma que calcula el valor eficaz ')
fprintf('\n\tM�todo de Integral compuesta de Simpson \n\n')
A=input('Ingrese la amplitud: ');
a = input ('Ingrese el valor inicial del periodo T: ');
b = input ('Ingrese el alor final del periodo T: ');
m=input ('Ingrese el n�mero de divisiones m: ');

h=(b-a)/m;
x=0;
suma=0;
suma1=0;
suma2=0;
suma=(A*sin(a))^2+(A*sin(b))^2;

for i=2.4:(m-2)
    suma1=suma+2*(A*sin(i))^2;
end
for i=1.3:(m-1)
    x=(((a+(i-1)*h)+(a+i*h))/2);
    suma2=suma1+4*(A*sin(x))^2;
end
valor=sqrt((1/(b-a))*((h/3)*suma2));
fprintf('\n El valor eficaz de la funci�n es : \n')
disp(valor)

