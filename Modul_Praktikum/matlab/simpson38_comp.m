function I = simpson38_comp(f,a,b,n)
%SIMPSON38_COMP Composite Simpson 3/8 rule on a uniform grid.
if n < 3 || mod(n,3) ~= 0
    error('Simpson 3/8 komposit memerlukan n kelipatan 3.');
end
h = (b-a)/n;
x = linspace(a,b,n+1);
y = f(x);
idx = 1:n-1;
w = 3*ones(size(idx));
w(mod(idx,3)==0) = 2;
I = 3*h/8 * (y(1) + sum(w.*y(2:end-1)) + y(end));
end
