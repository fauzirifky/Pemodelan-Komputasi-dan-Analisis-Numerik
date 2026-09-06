%% Praktikum 8: Euler dan RK4 pada model logistik
clear; clc; format long g
K=100; r=0.4; y0=10; f=@(t,y) r*y*(1-y/K);
tspan=[0 10]; h=0.5;
[tE,yE]=euler_ivp(f,tspan,y0,h);
[tR,yR]=rk4_ivp(f,tspan,y0,h);
yexact=@(t) K./(1+(K/y0-1).*exp(-r*t));
errE=max(abs(yE-yexact(tE))); errR=max(abs(yR-yexact(tR)));
fprintf('Max error Euler = %.3e, RK4 = %.3e\n',errE,errR);
figure; plot(tE,yexact(tE),'k-',tE,yE,'o--',tR,yR,'s--'); grid on
xlabel('t'); ylabel('y'); legend('Eksak','Euler','RK4','Location','best');
