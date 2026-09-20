%% Praktikum 10: pipeline terintegrasi dan verification & validation
clear; clc; format long g
K=100; r=0.4; y0=10;
yexact=@(t) K./(1+(K/y0-1).*exp(-r*t));
% 1) Pencarian akar: kapan populasi mencapai 80?
q=@(t) yexact(t)-80;
[t80,hroot]=bisection_fun(q,0,20,1e-10,100);
% 2) Simulasi model dengan RK4
f=@(t,y) r*y*(1-y/K); [t,y]=rk4_ivp(f,[0 10],y0,0.25);
% 3) Turunan numerik pada t=5 dari kurva analitik sebagai verification case
dy5=numdiff(yexact,5,'central',1e-3);
% 4) Integral numerik: area di bawah kurva 0<=t<=10
I=simpson_comp(yexact,0,10,100);
% 5) Residual verifikasi solver terhadap solusi analitik
err=max(abs(y-yexact(t)));
fprintf('t saat y=80       : %.8f\n',t80);
fprintf('dy/dt pada t=5    : %.8f\n',dy5);
fprintf('Integral y dt     : %.8f\n',I);
fprintf('Max error RK4     : %.3e\n',err);
