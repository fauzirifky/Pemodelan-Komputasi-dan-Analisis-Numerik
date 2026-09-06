function [t,y]=rk4_ivp(f,tspan,y0,h)
t=(tspan(1):h:tspan(2))'; if t(end)<tspan(2), t=[t;tspan(2)]; end
y=zeros(numel(t),numel(y0)); y(1,:)=y0(:)';
for n=1:numel(t)-1
    hn=t(n+1)-t(n); yn=y(n,:)'; tn=t(n);
    k1=f(tn,yn); k2=f(tn+hn/2,yn+hn*k1/2);
    k3=f(tn+hn/2,yn+hn*k2/2); k4=f(tn+hn,yn+hn*k3);
    y(n+1,:)=(yn+hn*(k1+2*k2+2*k3+k4)/6)';
end
end
