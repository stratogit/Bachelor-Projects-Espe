%ESCUELA POLITECNICA DEL EJERCITO'
%ELECTRONICA Y TELECOMUNICACIONES
%Sistemas de Comunicaciones
%Codigo de Linea

%Nombre:Felipe Leon
%Curso:7mo A

clear all;
close all;
clc
% 1) La frecuencia máxima en la señal
fmax=4000;
% 2) El número de muestras
N=30000;
% 3) Parámetros espectrales
fs=8000; %como es señal de voz la frecuencia de muestreo es 8khz
df=fs/N;
% 4) Parámetros temporales

b1=1;


disp('Mientras mayor sea el tiempo mas se demorara el programa en procesar la señal')

%ingreso del tiempo que se desea grabar maximo 10 segundos para que el
%procesamiento pueda ocasionar 
while (b1==1) 
tgra = input('escriba el tiempo en s que desee grabar el audio <=10s:  ');
    if tgra>10 
     b1=1;
    else
     b1=0;
    end
end
%se graba la señal en un archivo
X = wavrecord(16000*tgra,N,'double');
wavwrite(X,'in.wav');
input('presione enter para reproducir la vocal grabada')
%se lee el archivo y se guarda en la variable
Y= wavread('in.wav','double');
%se reproduce el archivo
wavplay(Y,N)
niveles = input('escriba los niveles de cuantizacion:  ');

cuentini=2;
l_Y = length(Y);  %longitud del vector de la señal minc l_Y
minc = l_Y/fs;
rm = floor(minc);
nummues = (rm*fs)+1;  %Numero de muestras, 

%Muestreo de la señal grabada
for k=cuentini:nummues   
    if k == cuentini
        muesen(k-1) = 0; 
        ind_pcm = 1;
    end
    residuo = rem(k,rm); %se obtiene el residuo con cada valor de k
    if residuo == 0 
        muesen(k) = Y(k);
    elseif residuo ~= 0 % se barre para cada valor de k y se va haciendo el muestreo
        muesen(k) = muesen(k-1);
    end
end

Mp = max (Y); %para obtener el valor maximo de la señal
tastep = (Mp*2)/niveles;  %Incremento entre cada nivel de cuant
parte = [-Mp:tastep:Mp]; %vector de parte (cuant)

%Cuantizacion
quant = quantiz(muesen,parte); %se obtiene la quantizacion de acuerdo al valor
pcmsig = dec2bin(quant);
ind_pcm = 1;
largo=length(quant);

CodNRZ=1;
%con este codigo se obtiene la señal digital de acuerdo a la codificacion
for i=1:1:largo 
        if (pcmsig(i)>='1')
            final=1;
        else 
            final=0;
        end
    CodNRZ=[CodNRZ,final];
 end


n=1;
l2=length(CodNRZ);
t2=n-1:1:l2-1;
y3 =awgn(CodNRZ,1,'measured',103);%se agrega un ruido blanco a toda la señal

 
figure(1);
 subplot(2,1,1);   plot(Y);  title('Señal Analogica'); xlabel('tiempo'); ylabel('amplitud');
 subplot(2,1,2);   stairs(muesen);  title('Señal Muestreada'); xlabel('tiempo'); ylabel('amplitud');
figure(2);
  subplot(3,1,1);plot(quant);  title('Señal Cuantizada'); xlabel('tiempo'); ylabel('niveles de cuantizacion');
  subplot(3,1,2);   stairs(CodNRZ); xlabel('Tiempo'); ylabel('Codigo');   title('Señal codificada');  axis([0 length(CodNRZ)-1 -1.5 1.5]);
  subplot(3,1,3);  plot(y3);title('Señal con ruido');

  
%analoga=d2a(CodNRZ,l2)
    
 
