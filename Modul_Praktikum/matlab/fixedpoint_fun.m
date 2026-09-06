function [x,history] = fixedpoint_fun(g,x0,tol,maxit)
iter=[]; xs=[]; errs=[];
for k=1:maxit
    x=g(x0); err=abs(x-x0)/max(1,abs(x));
    iter(end+1,1)=k; xs(end+1,1)=x; errs(end+1,1)=err;
    if err<=tol, break; end
    x0=x;
end
history=table(iter,xs,errs,'VariableNames',{'iter','x','err'});
end
