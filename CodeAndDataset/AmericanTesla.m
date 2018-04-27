close all; clear all; clc;
A=xlsread('C:\Users\LENOVO\Desktop\ame.xlsx');
A(:,3)=0;
B=A(:,3);
%---D=distance(24,120,24,121)  % distance  look matlab help
%---pi=3.1415926;
%---dx=D*6371*2*pi/360;
pi=3.1415926;  
for i=1:4151
    for j=i+1:4151
        if B(i)==1 
            break;
        end
        D=distance(A(i,1),A(i,2),A(j,1),A(j,2)); %-Physical distance between two places i&j
        dx=D*6371*pi/180;
        %--170mi=273.58848km
        if dx<241.4016 
            B(i)=1;
            break;
        end
    end
end
m=0;
for i=1:4151 %-Until now ，American has 4151 Tesla charging stations
    if B(i)==0
        m=m+1;
    end
end
m/4151
(4151-m)/4151
