function [x,history] = secant_fun(f,x0,x1,tol,maxit)
iter=[]; xs=[]; errs=[]; res=[];
for k=1:maxit
    f0=f(x0); f1=f(x1); den=f1-f0;
    if abs(den)<sqrt(eps), error('Penyebut metode sekan terlalu kecil.'); end
    x=x1-f1*(x1-x0)/den;
    err=abs(x-x1)/max(1,abs(x));
    iter(end+1,1)=k; xs(end+1,1)=x; errs(end+1,1)=err; res(end+1,1)=abs(f(x));
    if res(end)<=tol || err<=tol, break; end
    x0=x1; x1=x;
end
history=table(iter,xs,errs,res,'VariableNames',{'iter','x','err','residual'});
end
