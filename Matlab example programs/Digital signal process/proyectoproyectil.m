clc;
clear all;
g=9.81;
v=1:5000
E(v)=50;
var(v)=0.2;
rv(v)=rand(1,5000);
%v=50+0.2.*rv;
t=1:5000
E(t)=pi/3;
var(t)=pi/30;
rt(t)=rand(1,5000);
%t=pi/3+(pi/30).*rt;
figure;
subplot(4,2,1),plot(rv);
subplot(4,2,2),plot(rt);


xh=((rv.^2).*sin(2.*rt))/g;

subplot(4,1,3),hist(xh);
n=ceil(xh);
k=unique(xh);
ma=max(xh);
mi=min(xh);
freq=histc(xh,k)
%for i=1:5000
%freq(i)=sum(xh(:)==xh(i)) 
%end
freq2=freq/5000;
s=sum(freq2);
subplot(4,1,4),scatter(k,freq2,3);
max(freq);
figure;
plot(n)

%for i=1:l
 
%   k=0;
 %   for j=1:m
  %     if xh(i)==xh(j)
   %         if xh(i)~= 0
    %         k=k+1;
    %         if j ~= i
     %            xh(j)=0
     %        end
              
     %       end
     %   end
     %   j(i)=k
     %end
  %end
%xh
%j
%xh1=find(xh>0);

%xhf=xh(xh1)
%j1=find(j>0);
%jf=j(j1)
%figure;
%plot(xh,j)

%counts = sum(repmat(xh,ma,1) == repmat((1:ma)',1,length(xh)),2)';
%bibliografia que ayudo
%http://iimyo.forja.rediris.es/tutorial/estadistica.html 