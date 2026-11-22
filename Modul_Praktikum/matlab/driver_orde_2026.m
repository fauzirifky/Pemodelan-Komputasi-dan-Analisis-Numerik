clear; close all; clc; format long g
K=100; r=0.4; y0=10; tspan=[0 10]; hlist=[1 0.5 0.25 0.125];
f=@(t,y) r*y*(1-y/K); exact=@(t) K./(1+(K/y0-1).*exp(-r*t));
eE=zeros(size(hlist)); eH=eE; eR=eE;
for j=1:numel(hlist)
    h=hlist(j); [t,yE]=euler_ivp(f,tspan,y0,h);
    [~,yH]=heun_ivp(f,tspan,y0,h); [~,yR]=rk4_ivp(f,tspan,y0,h);
    yT=exact(t); eE(j)=max(abs(yE-yT)); eH(j)=max(abs(yH-yT)); eR(j)=max(abs(yR-yT));
end
pE=[NaN log(eE(1:end-1)./eE(2:end))/log(2)];
pH=[NaN log(eH(1:end-1)./eH(2:end))/log(2)];
pR=[NaN log(eR(1:end-1)./eR(2:end))/log(2)];
disp(table(hlist',eE',pE',eH',pH',eR',pR'))
