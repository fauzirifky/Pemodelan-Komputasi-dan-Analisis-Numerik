function I=simpson_comp(f,a,b,n)
if mod(n,2)~=0, error('Simpson 1/3 komposit memerlukan n genap.'); end
h=(b-a)/n; x=linspace(a,b,n+1); y=f(x);
I=h/3*(y(1)+y(end)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-2)));
end
