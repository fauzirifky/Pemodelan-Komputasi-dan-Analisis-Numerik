function [p,history]=gauss_newton_damped(model,Jfun,x,y,p0,tol,maxit)
p=p0(:); lambda=1e-6; iter=[]; step=[]; sse=[];
for k=1:maxit
    r=y-model(p,x); J=Jfun(p,x);
    A=J'*J; g=J'*r;
    delta=(A+lambda*max(1,trace(A)/length(p))*eye(length(p)))\g;
    alpha=1; old=sum(r.^2);
    while alpha>2^-12
        pt=p+alpha*delta; new=sum((y-model(pt,x)).^2);
        if new<old, break; end
        alpha=alpha/2;
    end
    pnew=p+alpha*delta; s=norm(pnew-p)/max(1,norm(pnew));
    p=pnew; iter(end+1,1)=k; step(end+1,1)=s; sse(end+1,1)=sum((y-model(p,x)).^2);
    if s<=tol, break; end
end
history=table(iter,step,sse);
end
