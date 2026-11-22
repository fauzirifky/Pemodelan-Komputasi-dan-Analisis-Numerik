function [t,y] = euler_ivp(f,tspan,y0,h)
%EULER_IVP Explicit Euler for scalar or vector IVP.
if h<=0, error('h harus positif.'); end
t=(tspan(1):h:tspan(2))';
if t(end)<tspan(2), t=[t;tspan(2)]; end
y=zeros(numel(t),numel(y0)); y(1,:)=y0(:)';
for n=1:numel(t)-1
    hn=t(n+1)-t(n); yn=y(n,:)';
    y(n+1,:)=(yn+hn*f(t(n),yn))';
end
end
