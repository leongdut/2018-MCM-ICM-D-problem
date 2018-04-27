clc;
clear;
a=xlsread('C:\Users\LENOVO\Desktop\aus.xlsx','Sheet1');
n = 25;
Sigma=[0.01,0;0,0.01];
datas = zeros(size(a,1)*n,2);
for i=1:size(a,1)  %-Simulation of Australia''s future charging station distribution
    mu = [a(i,1) a(i,2)];
    r=mvnrnd(mu,Sigma,n);
    datas((i-1)*n+1:(i-1)*n+n,:) = r;
end
plot(datas(:,1),datas(:,2),'b.');
hold on;
plot(a(:,1),a(:,2),'g.');
title('Simulation of Australia''s future charging station distribution');
xlabel('longitude');
ylabel('latitude');
grid on