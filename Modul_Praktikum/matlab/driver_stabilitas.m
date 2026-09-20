%% Praktikum 9: stabilitas dan pengaruh step size
clear; clc; format long g
lambda=-15; f=@(t,y) lambda*y; y0=1; tspan=[0 1];
hs=[0.2 0.1 0.05 0.025];
for k=1:numel(hs)
    h=hs(k); [tE,yE]=euler_ivp(f,tspan,y0,h); [tR,yR]=rk4_ivp(f,tspan,y0,h);
    exact=exp(lambda*tE);
    T(k,:)=[h,max(abs(yE-exact)),max(abs(yR-exact))];
end
disp(array2table(T,'VariableNames',{'h','errEuler','errRK4'}));
% Euler stabil untuk masalah uji y'=lambda*y jika |1+h*lambda|<1.
