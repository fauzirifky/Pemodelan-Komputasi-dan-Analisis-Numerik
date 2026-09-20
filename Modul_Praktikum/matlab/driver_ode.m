%% DRIVER PDB: Euler, Heun, RK4 versus solusi eksak
clear;clc;close all;format long g
K=100;r=0.4;y0=10;tspan=[0 10];h=0.5;
f=@(t,y) r*y*(1-y/K);
exact=@(t) K./(1+(K/y0-1).*exp(-r*t));
[t,yEuler]=euler_ivp(f,tspan,y0,h);
[~,yHeun]=heun_ivp(f,tspan,y0,h);
[~,yRK4]=rk4_ivp(f,tspan,y0,h);
yTrue=exact(t);
errs=[max(abs(yEuler-yTrue)),max(abs(yHeun-yTrue)),...
      max(abs(yRK4-yTrue))];
fprintf('Error maksimum Euler/Heun/RK4: %g %g %g\n',errs)
figure;plot(t,yTrue,'k-',t,yEuler,'o-',t,yHeun,'s-',t,yRK4,'^-')
grid on;xlabel('t');ylabel('y(t)');legend('Eksak','Euler','Heun','RK4')
figure;semilogy(t,max(abs(yEuler-yTrue),eps),'o-',...
 t,max(abs(yHeun-yTrue),eps),'s-',...
 t,max(abs(yRK4-yTrue),eps),'^-');grid on
xlabel('t');ylabel('Galat absolut')
legend('Euler','Heun','RK4');title('Perbandingan galat solusi PDB')
