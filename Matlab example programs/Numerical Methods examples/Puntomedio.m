clear all;
clc;
close all;
fprintf('\tPrograma que calcula el valor eficaz ')
fprintf('\n\tMétodo de Integral compuesta del Punto Medio \n\n')
A=input('Ingrese la amplitud: ');
a = input ('Ingrese el valor inicial del periodo T: ');
b = input ('Ingrese el alor final del periodo T: ');
m=input ('Ingrese el número de divisiones m: ');

h=(b-a)/m;
x=0;
suma=0;
suma2=0;

for i=1.3:(m-1)
    x=(((a+(i-1)*h)+(a+i*h))/2);
    suma=suma2+4*(A*sin(x))^2;
end
valor=sqrt((1/(b-a))*(h)*suma);
fprintf('\n El valor eficaz de la función es : \n')
disp(valor)

