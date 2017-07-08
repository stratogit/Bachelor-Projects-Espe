%        ESCUELA POLITECNICA DEL EJERCITO
% Curso:  7 mo "A"    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
[y, Fs, nbits] = wavread('7');
[y1] = wavread('7',[16800 28000]);
figure(1);
plot(y1);
figure(2);
plot(y),
title('Señal Ingresada')
grid on
siz = wavread('7','size');
N=31730;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Densidad espectral de frecuencia
z=autocorr(y1);
Y=fft(z,N);
Pyy=Y.*conj(Y)/N;
f=(Fs/N)*(0:N/2-1);
figure(3);
plot(f,Pyy(1:N/2)),title('Densidad Espectral')
grid on;
figure(4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Espectro de amplitud
L=N;
NFFT = 2^nextpow2(L);
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
plot(f,2*abs(Y(1:NFFT/2))) 
title('Densidad Espectral de Frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('|Y(f)|');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Proceso de muestreo y decodificacion ADC
yd = y1.*100
% envio de datos por un codigo maximo hasta 40
tam=length(yd);
for k=1:2000
    yd(k)
    if(yd(k)<0 )
        yd(k)=yd(k)*-1;
        if(yd(k)>0 && yd(k)<2),cod= [1 0 0 0 0 0 1 0 ],end
        if(yd(k)>2 && yd(k)<4),cod= [1 0 0 0 0 1 0 0 ],end
        if(yd(k)>4 && yd(k)<6),cod= [1 0 0 0 0 1 1 0 ],end
        if(yd(k)>6 && yd(k)<8),cod= [1 0 0 0 1 0 0 0 ],end
        if(yd(k)>8 && yd(k)<10),cod= [1 0 0 0 1 0 1 0 ],end
        if(yd(k)>10 && yd(k)<12),cod= [1 0 0 0 1 1 0 0 ],end
        if(yd(k)>12 && yd(k)<14),cod= [1 0 0 0 1 1 1 0 ],end
        if(yd(k)>14 && yd(k)<16),cod= [1 0 0 1 0 0 0 0 ],end
        if(yd(k)>16 && yd(k)<18),cod= [1 0 0 1 0 0 1 0 ],end
        if(yd(k)>18 && yd(k)<20),cod= [1 0 0 1 0 1 0 0 ],end
        if(yd(k)>20 && yd(k)<22),cod= [1 0 0 1 0 1 1 0 ],end
        if(yd(k)>22 && yd(k)<24),cod= [1 0 0 1 1 0 0 0 ],end
        if(yd(k)>24 && yd(k)<26),cod= [1 0 0 1 1 0 1 0 ],end
        if(yd(k)>26 && yd(k)<28),cod= [1 0 0 1 1 1 0 0 ],end
        if(yd(k)>28 && yd(k)<30),cod= [1 0 0 1 1 1 1 0 ],end
        if(yd(k)>30 && yd(k)<32),cod= [1 0 1 0 0 0 0 0 ],end
        if(yd(k)>32 && yd(k)<34),cod= [1 0 1 0 0 0 1 0 ],end
        if(yd(k)>34 && yd(k)<36),cod= [1 0 1 0 0 1 0 0 ],end
        if(yd(k)>36 && yd(k)<38),cod= [1 0 1 0 0 1 1 0 ],end
        if(yd(k)>38 && yd(k)<40),cod= [1 0 1 0 1 0 0 0 ],end
          yd(k)=yd(k)*-1;
    end
    if(yd(k)>0 )
          if(yd(k)>0 && yd(k)<2),cod= [0 0 0 0 0 0 1 0 ],end
        if(yd(k)>2 && yd(k)<4),cod= [0 0 0 0 0 1 0 0 ],end
        if(yd(k)>4 && yd(k)<6),cod= [0 0 0 0 0 1 1 0 ],end
        if(yd(k)>6 && yd(k)<8),cod= [0 0 0 0 1 0 0 0 ],end
        if(yd(k)>8 && yd(k)<10),cod= [0 0 0 0 1 0 1 0 ],end
        if(yd(k)>10 && yd(k)<12),cod= [0 0 0 0 1 1 0 0 ],end
        if(yd(k)>12 && yd(k)<14),cod= [0 0 0 0 1 1 1 0 ],end
        if(yd(k)>14 && yd(k)<16),cod= [0 0 0 1 0 0 0 0 ],end
        if(yd(k)>16 && yd(k)<18),cod= [0 0 0 1 0 0 1 0 ],end
        if(yd(k)>18 && yd(k)<20),cod= [0 0 0 1 0 1 0 0 ],end
        if(yd(k)>20 && yd(k)<22),cod= [0 0 0 1 0 1 1 0 ],end
        if(yd(k)>22 && yd(k)<24),cod= [0 0 0 1 1 0 0 0 ],end
        if(yd(k)>24 && yd(k)<26),cod= [0 0 0 1 1 0 1 0 ],end
        if(yd(k)>26 && yd(k)<28),cod= [0 0 0 1 1 1 0 0 ],end
        if(yd(k)>28 && yd(k)<30),cod= [0 0 0 1 1 1 1 0 ],end
        if(yd(k)>30 && yd(k)<32),cod= [0 0 1 0 0 0 0 0 ],end
        if(yd(k)>32 && yd(k)<34),cod= [0 0 1 0 0 0 1 0 ],end
        if(yd(k)>34 && yd(k)<36),cod= [0 0 1 0 0 1 0 0 ],end
        if(yd(k)>36 && yd(k)<38),cod= [0 0 1 0 0 1 1 0 ],end
        if(yd(k)>38 && yd(k)<40),cod= [0 0 1 0 1 0 0 0 ],end
    end
end
figure(5);
plot(cod)
