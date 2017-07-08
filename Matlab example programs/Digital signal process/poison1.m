clc
clear all

fprintf ('\t\t\t\t\t\t\t\t Escuela politecnica del Ejercito')
fprintf('\n\t\t\t\t\t\t\t\t\t Procesos estocasticos')
fprintf('\n\t\t\t\t\t\t\t Ejercio 1 variable aleatoria')
fprintf('\n\t\t\t\t\t\t Nombre: Felipe Leon');
fprintf('\n\t\t\t\t\t\t Curso: 5to ETE B ');

k=[0:1:15];
l=10; %lambda
e1=exp(-l); % e elevado a la menos lambda
l1=l.^k;
f=factorial(k);
poi1=e1*(l1./f); %./ divide para cada termino del vector
stem(k,poi1);
s=sum(poi1); %sumatoria de cada uno de los terminos de lambda para la variable aleatoria
r=1-s;

fprintf('\n\n la respuesta es: %f',r);