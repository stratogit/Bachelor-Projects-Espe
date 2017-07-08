#include <16F877A.h>
//#device *=16
#device adc=10

#FUSES NOWDT                    //No Watch Dog Timer
#FUSES XT                       //Crystal osc <= 4mhz
#FUSES PUT                      //Power Up Timer
#FUSES NOPROTECT                //Code not protected from reading
#FUSES NODEBUG                  //No Debug mode for ICD
#FUSES BROWNOUT                 //Reset when brownout detected
#FUSES NOLVP                    //No low voltage prgming, B3(PIC16) or B5(PIC18) used for I/O
#FUSES NOCPD                    //No EE protection
#FUSES NOWRT                    //Program memory not write protected

#use delay(clock=4000000)
#use rs232(baud=9600,parity=N,xmit=PIN_C6,rcv=PIN_C7,bits=8)
#USE STANDARD_IO(D)

#byte TRISA = 0x85
#byte TRISB = 0x88
#byte TRISC = 0x87
#byte TRISD = 0x88
#byte TRISE = 0x89
#byte porta = 0x05
#byte portb = 0x06
#byte portc = 0x07
#byte portd = 0x08
#byte porte = 0x09


int16 seg = 1;///50
//int32 pos_max = 65535;
int32 pos_lab=0;
//int32 pos_uC=0;
int32 timer;
int32 T;
//int i;

char  rx;
int8  recibido[18];
int8  puntero,unid,dece,cent,mile,dec_mil = 0;
int16  refTemp1 = 25;
int16  refTemp2 = 25;


unsigned char fase;  // cuenta desde  255 hasta 0 para cada mitad de ciclo
unsigned char dim_nivel;  // el nivel deseado de dimmer de  0-255 (0-100%);
unsigned char ciclo_conteo;  // cuenta mitades de ciclo
unsigned char modo;  // el modo

#int_RDA
void  RDA_isr(void) 
{
   rx = getchar();
   if (rx ==' '){
      rx = '0';
   }
      if (rx == 's'){
      puntero = 0;
   }
   if (rx == 'a'){
      cent = recibido[1]-48;
      dece = recibido[2]-48;
      unid = recibido[3]-48;
      refTemp1 = cent*100 + dece*10+unid;
      refTemp1 *=100;

      cent = recibido[4]-48;
      dece = recibido[5]-48;
      unid = recibido[6]-48;
      refTemp2 = cent*100 + dece*10+unid;
      refTemp2 *= 100;
      
      dec_mil = recibido[7]-48;
      mile = recibido[8]-48;
      unid = recibido[9]-48;
      dece = recibido[10]-48;
      unid = recibido[11]-48;      
      seg = dec_mil*10000 + mile*1000 + cent*100 + dece*10 + unid;
  
      dec_mil = recibido[12]-48;
      mile = recibido[13]-48;
      cent = recibido[14]-48;
      dece = recibido[15]-48;
      unid = recibido[16]-48;      
      pos_lab = dec_mil*10000 + mile*1000 + cent*100 + dece*10 + unid;   
   }
      recibido[puntero] = rx;
      puntero++;
}

#int_EXT 
void  EXT_isr(void) {
   ciclo_conteo ++;
   if (ciclo_conteo == 1){
    set_timer0(0);
   }
   if (ciclo_conteo > 1){
    timer=get_timer0();
    T=(4*256*(256-timer))/40000000;
    fase=T-(T*pos_lab/100);
    output_low(PIN_B1);
    delay_us(fase);
    output_high(PIN_B1);
    dim_nivel=(T*pos_lab/100);
    delay_us(dim_nivel);
    }


}

void main()
{
   trisb = 0x01;
   portb = 0x00;
 
   

   // reset stuff
   //fase = 0;
   //dim_nivel = 0;
   //modo = 0;
   //ciclo_conteo = 0;
   
   setup_timer_0(RTCC_INTERNAL|RTCC_DIV_256);
   enable_interrupts(INT_EXT);
   ext_int_edge(L_TO_H);
   enable_interrupts(INT_RDA);
   enable_interrupts(GLOBAL);
  
  pos_lab=100;


 while(1){
     
    
    
     restart_wdt();
   }
}
