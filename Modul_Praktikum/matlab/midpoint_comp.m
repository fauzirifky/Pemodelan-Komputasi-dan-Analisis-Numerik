function I=midpoint_comp(f,a,b,n)
h=(b-a)/n; xm=a+h*((1:n)-0.5); I=h*sum(f(xm));
end
