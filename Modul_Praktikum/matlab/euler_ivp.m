function [t,y]=euler_ivp(f,tspan,y0,h)
t=(tspan(1):h:tspan(2))'; if t(end)<tspan(2), t=[t;tspan(2)]; end
y=zeros(numel(t),numel(y0)); y(1,:)=y0(:)';
for n=1:numel(t)-1
    hn=t(n+1)-t(n); y(n+1,:)=y(n,:)+hn*f(t(n),y(n,:))';
end
end
