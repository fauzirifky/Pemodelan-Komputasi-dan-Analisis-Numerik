function [t,y] = heun_ivp(f,tspan,y0,h)
%HEUN_IVP Explicit trapezoidal predictor-corrector for scalar/vector ODE.
if h<=0, error('h harus positif');end
t=(tspan(1):h:tspan(2))';
if t(end)<tspan(2),t=[t;tspan(2)];end
n=numel(y0);y=zeros(numel(t),n);y(1,:)=y0(:)';
for k=1:numel(t)-1
    hk=t(k+1)-t(k);tk=t(k);yn=y(k,:)';
    k1=f(tk,yn);predictor=yn+hk*k1;
    k2=f(tk+hk,predictor);
    y(k+1,:)=(yn+hk*(k1+k2)/2)';
end
end
