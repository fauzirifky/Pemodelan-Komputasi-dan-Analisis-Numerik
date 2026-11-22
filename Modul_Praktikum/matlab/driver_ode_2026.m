clear; close all; clc; format long g
K=100; r=0.4; y0=10; tspan=[0 10]; h=0.5;
f=@(t,y) r*y*(1-y/K);
exact=@(t) K./(1+(K/y0-1).*exp(-r*t));
[t,yE]=euler_ivp(f,tspan,y0,h);
[~,yH]=heun_ivp(f,tspan,y0,h);
[~,yR]=rk4_ivp(f,tspan,y0,h);
yT=exact(t);
disp(table(t,yT,yE,yH,yR,abs(yE-yT),abs(yH-yT),abs(yR-yT)))
