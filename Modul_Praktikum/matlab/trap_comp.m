function I = trap_comp(f,a,b,n)
%TRAP_COMP Composite trapezoidal rule on a uniform grid.
if ~isscalar(n) || n<1 || fix(n)~=n, error('n harus bilangan bulat positif.'); end
h=(b-a)/n; x=linspace(a,b,n+1); y=f(x);
I=h/2*(y(1)+2*sum(y(2:end-1))+y(end));
end
