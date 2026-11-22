function [x,history] = secant_fun(f,x0,x1,tol,maxit)
%SECANT_FUN Secant method with convergence history.
if nargin<5, maxit=100; end
if nargin<4, tol=1e-10; end
iter=zeros(maxit,1); xhist=zeros(maxit,1); err=zeros(maxit,1); residual=zeros(maxit,1);
for k=1:maxit
    f0=f(x0); f1=f(x1); den=f1-f0;
    if abs(den)<sqrt(eps), error('Penyebut metode Secant terlalu kecil.'); end
    x=x1-f1*(x1-x0)/den;
    e=abs(x-x1)/max(1,abs(x));
    iter(k)=k; xhist(k)=x; err(k)=e; residual(k)=abs(f(x));
    if residual(k)<=tol || e<=tol, break; end
    x0=x1; x1=x;
end
history=table(iter(1:k),xhist(1:k),err(1:k),residual(1:k), ...
    'VariableNames',{'iter','x','err','residual'});
end
