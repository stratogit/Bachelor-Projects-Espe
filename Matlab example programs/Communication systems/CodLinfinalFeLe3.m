%ESCUELA POLITECNICA DEL EJERCITO'
%ELECTRONICA Y TELECOMUNICACIONES
%Sistemas de Comunicaciones
%Codigo de Linea

%Nombre:Felipe Leon
%Curso:7mo A

clear all;
close all;
clc
% 1) La frecuencia m�xima en la se�al
fmax=4000;
% 2) El n�mero de muestras
N=30000;
% 3) Par�metros espectrales
fs=8000; %como es se�al de voz la frecuencia de muestreo es 8khz
df=fs/N;
% 4) Par�metros temporales

b1=1;


disp('Mientras mayor sea el tiempo mas se demorara el programa en procesar la se�al')

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
%se graba la se�al en un archivo
X = wavrecord(16000*tgra,N,'double');
wavwrite(X,'in.wav');
input('presione enter para reproducir la vocal grabada')
%se lee el archivo y se guarda en la variable
Y= wavread('in.wav','double');
%se reproduce el archivo
wavplay(Y,N)
niveles = input('escriba los niveles de cuantizacion:  ');

cuentini=2;
l_Y = length(Y);  %longitud del vector de la se�al minc l_Y
minc = l_Y/fs;
rm = floor(minc);
nummues = (rm*fs)+1;  %Numero de muestras, 

%Muestreo de la se�al grabada
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

Mp = max (Y); %para obtener el valor maximo de la se�al
tastep = (Mp*2)/niveles;  %Incremento entre cada nivel de cuant
parte = [-Mp:tastep:Mp]; %vector de parte (cuant)

%Cuantizacion
quant = quantiz(muesen,parte); %se obtiene la quantizacion de acuerdo al valor
pcmsig = dec2bin(quant);
ind_pcm = 1;
largo=length(quant);

CodNRZ=1;
%con este codigo se obtiene la se�al digital de acuerdo a la codificacion
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
y3 =awgn(CodNRZ,1,'measured',103);%se agrega un ruido blanco a toda la se�al

 
figure(1);
 subplot(2,1,1);   plot(Y);  title('Se�al Analogica'); xlabel('tiempo'); ylabel('amplitud');
 subplot(2,1,2);   stairs(muesen);  title('Se�al Muestreada'); xlabel('tiempo'); ylabel('amplitud');
figure(2);
  subplot(3,1,1);plot(quant);  title('Se�al Cuantizada'); xlabel('tiempo'); ylabel('niveles de cuantizacion');
  subplot(3,1,2);   stairs(CodNRZ); xlabel('Tiempo'); ylabel('Codigo');   title('Se�al codificada');  axis([0 length(CodNRZ)-1 -1.5 1.5]);
  subplot(3,1,3);  plot(y3);title('Se�al con ruido');

  
%analoga=d2a(CodNRZ,l2)
    
 
