clear; close all; clc; format long g
K1=40; K2=60; r1=1; r2=0.5; tau1=4; tau2=10; tspan=[0 16]; h=0.5;
L1=@(t) K1./(1+exp(-r1*(t-tau1)));
L2=@(t) K2./(1+exp(-r2*(t-tau2)));
D=@(t) L1(t)+L2(t);
g=@(t) K1*r1*exp(-r1*(t-tau1))./(1+exp(-r1*(t-tau1))).^2 + ...
       K2*r2*exp(-r2*(t-tau2))./(1+exp(-r2*(t-tau2))).^2;
f=@(t,y) g(t); y0=D(0);
[t,yE]=euler_ivp(f,tspan,y0,h); [~,yH]=heun_ivp(f,tspan,y0,h); [~,yR]=rk4_ivp(f,tspan,y0,h);
disp(table(t,D(t),yE,yH,yR))
