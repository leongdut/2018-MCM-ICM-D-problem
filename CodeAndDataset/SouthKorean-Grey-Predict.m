clc;
clear;
syms a b;
c=[a b]';
A=[1344,1884,2484,3369,6179,17034,30758];%-South Korea's total EVs from 2011-2017
B=cumsum(A); %-The original data is accumulated
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2; %-Generate cumulative matrix
end
%calculate the to be determined parameters
D=A;D(1)=[];
D=D';
E=[-C;ones(1,n-1)];
c=inv(E*E')*E*D;
c=c';
a=c(1);b=c(2);  %-Forecast follow-up-year data 
F=[];F(1)=A(1);
for i=2:(n+2)
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a; %-Get the predicted data from 2011-2031
end
G=[];G(1)=A(1);
for i=2:(n+2)
    G(i)=F(i)-F(i-1)+4000;
end
t1=2011:2017;
t2=2011:2019;
G;a,b %-Predict output, growth factor, and amount of gray action

plot(t2,G,'g','LineWidth',2,'Color',[0.5 0.7 0.5]) %-Comparison of raw and forecast data
hold on
plot(t1,A,'.','MarkerSize',20)
grid on
title(' Predicted total EVs in South Korea from 2011-2019')
xlabel('Year');
ylabel('Total EVs')
