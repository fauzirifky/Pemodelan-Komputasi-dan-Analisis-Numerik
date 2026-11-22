function [t,y] = heun_ivp(f,tspan,y0,h)
%HEUN_IVP Improved Euler / Heun method for scalar or vector IVP.
if h<=0, error('h harus positif.'); end
t=(tspan(1):h:tspan(2))';
if t(end)<tspan(2), t=[t;tspan(2)]; end
y=zeros(numel(t),numel(y0)); y(1,:)=y0(:)';
for n=1:numel(t)-1
    hn=t(n+1)-t(n); tn=t(n); yn=y(n,:)';
    k1=f(tn,yn); k2=f(tn+hn,yn+hn*k1);
    y(n+1,:)=(yn+hn*(k1+k2)/2)';
end
end
