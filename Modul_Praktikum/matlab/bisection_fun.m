function [x,history] = bisection_fun(f,a,b,tol,maxit)
%BISECTION_FUN Bisection method with convergence history.
if nargin<5, maxit=100; end
if nargin<4, tol=1e-10; end
fa=f(a); fb=f(b);
if fa*fb>0, error('Interval awal tidak mengurung akar.'); end
iter=zeros(maxit,1); xhist=zeros(maxit,1); err=zeros(maxit,1); residual=zeros(maxit,1);
xOld=NaN;
for k=1:maxit
    x=(a+b)/2; fx=f(x);
    if k==1, e=Inf; else, e=abs(x-xOld)/max(1,abs(x)); end
    iter(k)=k; xhist(k)=x; err(k)=e; residual(k)=abs(fx);
    if abs(fx)<=tol || e<=tol, break; end
    if fa*fx<0, b=x; fb=fx; else, a=x; fa=fx; end
    xOld=x;
end
history=table(iter(1:k),xhist(1:k),err(1:k),residual(1:k), ...
    'VariableNames',{'iter','x','err','residual'});
end
