clear; close all; clc; format long g
mu=1; tspan=[0 30]; y0=[2;0]; hlist=[0.4 0.2 0.1];
f=@(t,y)[y(2);mu*(1-y(1)^2)*y(2)-y(1)];
for h=hlist
    [tE,yE]=euler_ivp(f,tspan,y0,h);
    [tH,yH]=heun_ivp(f,tspan,y0,h);
    [tR,yR]=rk4_ivp(f,tspan,y0,h);
    figure; plot(tE,yE(:,1),'o-',tH,yH(:,1),'s-',tR,yR(:,1),'^-')
    grid on; title(sprintf('Van der Pol, h=%.2f',h)); legend('Euler','Heun','RK4')
end
