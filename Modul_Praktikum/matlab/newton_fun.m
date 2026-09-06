function [x,history] = newton_fun(f,df,x0,tol,maxit)
iter=[]; xs=[]; errs=[]; res=[];
for k=1:maxit
    d=df(x0);
    if abs(d)<sqrt(eps), error('Turunan terlalu kecil.'); end
    x=x0-f(x0)/d;
    err=abs(x-x0)/max(1,abs(x));
    iter(end+1,1)=k; xs(end+1,1)=x; errs(end+1,1)=err; res(end+1,1)=abs(f(x));
    if res(end)<=tol || err<=tol, break; end
    x0=x;
end
history=table(iter,xs,errs,res,'VariableNames',{'iter','x','err','residual'});
end
