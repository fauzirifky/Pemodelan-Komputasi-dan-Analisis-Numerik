function [x,history] = bisection_fun(f,a,b,tol,maxit)
fa=f(a); fb=f(b);
if fa*fb>0, error('Interval awal tidak mengurung akar.'); end
xold = NaN; iter=[]; xs=[]; errs=[]; res=[];
for k=1:maxit
    x=(a+b)/2; fx=f(x);
    if k==1, err=Inf; else, err=abs(x-xold)/max(1,abs(x)); end
    iter(end+1,1)=k; xs(end+1,1)=x; errs(end+1,1)=err; res(end+1,1)=abs(fx);
    if abs(fx)<=tol || err<=tol, break; end
    if fa*fx<0
        b=x; fb=fx;
    else
        a=x; fa=fx;
    end
    xold=x;
end
history=table(iter,xs,errs,res,'VariableNames',{'iter','x','err','residual'});
end
