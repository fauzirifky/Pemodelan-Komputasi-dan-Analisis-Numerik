function [x,history]=newton_system(F,J,x0,tol,maxit)
x=x0(:); iter=[]; step=[]; residual=[];
for k=1:maxit
    Fx=F(x); Jx=J(x);
    delta=-Jx\Fx; xnew=x+delta;
    r=norm(F(xnew),2); s=norm(delta,2)/max(1,norm(xnew,2));
    iter(end+1,1)=k; step(end+1,1)=s; residual(end+1,1)=r;
    x=xnew;
    if r<=tol || s<=tol, break; end
end
history=table(iter,step,residual);
end
