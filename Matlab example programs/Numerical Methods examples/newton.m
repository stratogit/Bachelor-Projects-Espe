% metodo de newton
%Creación de variables
sw=0; %variable de entrada o salida
p=0; %variable calculo de raiz
f=0; %variable para función
fd=0; %variable para deriveda de función
while (sw==0)
    clc; %Borrado de pantalla
    %Despliegue de opciones de menú
    disp('        Métodos para encontrar la raiz de una Ecuación');
    disp('1) Método de Newton');
    disp('2) Método de la secante');
    disp('3) Salir');
    op=input('Ingrese opción: '); %lectura de opción
    switch (op) %inicio de menú
        case 1
            %Metodo de newton
            clc;%Borrado de pantalla
            disp('Método de Newton');
            f=input('Ingrese funcion: ');%ingreso de función
            fd=input('Ingrese la derivada de la funcion: ');%ingreso de deribada de función
            n=input('Ingrese el numero de interacciones: ');%ingreso de interacciones
            a=input('Ingrese inicio de intervalo: ');%inicio intervalo
            b=input('Ingrese fin de intervalo: ');%Fin intervalo
            p(1)=(a+b)/2; %calculo de primer dato
            f=inline(f); %cambio de variable normal a variable en función de x
            fd=inline(fd); %cambio de variable normal a variable en función de x
            %Proceso repetitivo parar calculo de raiz
            for (i=1:n)
                p(2)=p(1)-((f(p(1)))/(fd(p(1))));%aplicación de formula
                p(1)=p(2);%reasignación de variables para nuevo proceso
            end
            %impresion de resultados
            disp('Respuesta es:');
            p(2)
            sw=0;
            disp('Presione enter para continuar');
            pause; %pausa antes de regresar al menú principal
        case 2
            %mètodo de la secante
            clc;%Borrado de pantalla
            disp('Método de la Secante');
            f=input('Ingrese funcion: ');%ingreso de función
            n=input('Ingrese el numero de interacciones: ');%ingreso de interacciones
            a=input('Ingrese inicio de intervalo: ');%inicio intervalo
            b=input('Ingrese fin de intervalo: ');%Fin intervalo
            f=inline(f);%cambio de variable normal a variable en función de x
            p1(1)=(a+b)/2;%calculo de primer dato
            p1(2)=p1(1)-(((f(a)-f(p1(1)))*(f(p1(1))))/(f(a)-f(p1(1))));%calculo del segundo dato
            %Proceso repetitivo parar calculo de raiz
            for (j=1:n)
                p1(3)=p1(2)-(((f(p1(1))-f(p1(2)))*(f(p1(2))))/(f(p1(1))-f(p1(2))));%aplicación de formula
                p1(1)=p1(2);%reasignación de variables para nuevo proceso
                p1(2)=p1(3);%reasignación de variables para nuevo proceso
            end
            %impresion de resultados
            disp('Respuesta es:');
            p1(3)
            sw=0;
            disp('Presione enter para continuar');
            pause;%pausa antes de regresar al menú principal
        case 3
            clc;%borrado de pantalla
            sw=1;%cambio de valor variable sw para salir de menú
    end
end
