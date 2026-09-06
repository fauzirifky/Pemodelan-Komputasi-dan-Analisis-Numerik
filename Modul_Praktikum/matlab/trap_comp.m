function I=trap_comp(f,a,b,n)
h=(b-a)/n; x=linspace(a,b,n+1); y=f(x);
I=h*(0.5*y(1)+sum(y(2:end-1))+0.5*y(end));
end
