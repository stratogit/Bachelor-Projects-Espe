#include <18F2550.h>    //Se pone el nombre del pic que vamos a utilizar'
#device adc=8
#fuses XTPLL,MCLR,NOWDT,NOPROTECT,NOLVP,NODEBUG,USBDIV,PLL1,CPUDIV1,VREGEN
#use delay(clock=48000000)  //fusibles, aquí se especifica características como

#include "usb_cdc.h" // Descripción de funciones del USB. 
#include "usb_desc_cdc.h" // Descriptores del dispositivo USB. 

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#byte trisb   =  0xF93
#byte portb   =  0xF81

void main(void) 
{

int a=0,y=0,x=0;
char d;
set_TRIS_C(11111011); //RC2 salida
SETUP_CCP1(CCP_PWM); //CCP1 como PWM
SETUP_CCP2(CCP_PWM);
SET_TIMER2(0xAA); //cargo 0xAA en el timer 2
SETUP_TIMER_2(T2_DIV_BY_4,0xF0,1); 

setup_adc_ports(AN0|VSS_VDD);
setup_adc(ADC_CLOCK_INTERNAL);
set_tris_b(0x00);
   
usb_cdc_init(); // Configuramos al puerto virtual.
usb_init(); // Inicializamos el stack USB.
while(!usb_cdc_connected()) {}
while (true)
  {
   usb_task();
   if (usb_enumerated())
      {       
      while (usb_cdc_kbhit())
         { 
        d=usb_cdc_getc();// creo una cadena de string con el dato enviado desde labview       
         }    
         a=read_adc();  //leo lo del conversor analogo digital            
         delay_ms(2);
              usb_cdc_putc((char)a);
              delay_ms(100);
         if (d=='A')
            {
            SET_PWM2_DUTY(0);    //ventilador
            for (x=0;x<255;x++){
            SET_PWM1_DUTY(x);    //niquelina    
            }
              }
         if (d=='D')
            {
            y=0;
            SET_PWM1_DUTY(y);
            SET_PWM2_DUTY(255);            
            }         
      }
   } 
} 
    

