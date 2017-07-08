% metodo de newton
%Creaci�n de variables
sw=0; %variable de entrada o salida
p=0; %variable calculo de raiz
f=0; %variable para funci�n
fd=0; %variable para deriveda de funci�n
while (sw==0)
    clc; %Borrado de pantalla
    %Despliegue de opciones de men�
    disp('        M�todos para encontrar la raiz de una Ecuaci�n');
    disp('1) M�todo de Newton');
    disp('2) M�todo de la secante');
    disp('3) Salir');
    op=input('Ingrese opci�n: '); %lectura de opci�n
    switch (op) %inicio de men�
        case 1
            %Metodo de newton
            clc;%Borrado de pantalla
            disp('M�todo de Newton');
            f=input('Ingrese funcion: ');%ingreso de funci�n
            fd=input('Ingrese la derivada de la funcion: ');%ingreso de deribada de funci�n
            n=input('Ingrese el numero de interacciones: ');%ingreso de interacciones
            a=input('Ingrese inicio de intervalo: ');%inicio intervalo
            b=input('Ingrese fin de intervalo: ');%Fin intervalo
            p(1)=(a+b)/2; %calculo de primer dato
            f=inline(f); %cambio de variable normal a variable en funci�n de x
            fd=inline(fd); %cambio de variable normal a variable en funci�n de x
            %Proceso repetitivo parar calculo de raiz
            for (i=1:n)
                p(2)=p(1)-((f(p(1)))/(fd(p(1))));%aplicaci�n de formula
                p(1)=p(2);%reasignaci�n de variables para nuevo proceso
            end
            %impresion de resultados
            disp('Respuesta es:');
            p(2)
            sw=0;
            disp('Presione enter para continuar');
            pause; %pausa antes de regresar al men� principal
        case 2
            %m�todo de la secante
            clc;%Borrado de pantalla
            disp('M�todo de la Secante');
            f=input('Ingrese funcion: ');%ingreso de funci�n
            n=input('Ingrese el numero de interacciones: ');%ingreso de interacciones
            a=input('Ingrese inicio de intervalo: ');%inicio intervalo
            b=input('Ingrese fin de intervalo: ');%Fin intervalo
            f=inline(f);%cambio de variable normal a variable en funci�n de x
            p1(1)=(a+b)/2;%calculo de primer dato
            p1(2)=p1(1)-(((f(a)-f(p1(1)))*(f(p1(1))))/(f(a)-f(p1(1))));%calculo del segundo dato
            %Proceso repetitivo parar calculo de raiz
            for (j=1:n)
                p1(3)=p1(2)-(((f(p1(1))-f(p1(2)))*(f(p1(2))))/(f(p1(1))-f(p1(2))));%aplicaci�n de formula
                p1(1)=p1(2);%reasignaci�n de variables para nuevo proceso
                p1(2)=p1(3);%reasignaci�n de variables para nuevo proceso
            end
            %impresion de resultados
            disp('Respuesta es:');
            p1(3)
            sw=0;
            disp('Presione enter para continuar');
            pause;%pausa antes de regresar al men� principal
        case 3
            clc;%borrado de pantalla
            sw=1;%cambio de valor variable sw para salir de men�
    end
end
