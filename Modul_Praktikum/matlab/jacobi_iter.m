function [x,history]=jacobi_iter(A,b,x0,tol,maxit)
[n,m]=size(A); if n~=m || length(b)~=n, error('Dimensi tidak cocok.'); end
D=diag(A); if any(abs(D)<eps), error('Diagonal A memuat nol.'); end
iter=[]; err=[]; residual=[];
for k=1:maxit
    x=(b-(A-diag(D))*x0)./D;
    e=norm(x-x0,inf)/max(1,norm(x,inf)); r=norm(A*x-b,inf);
    iter(end+1,1)=k; err(end+1,1)=e; residual(end+1,1)=r;
    if e<=tol && r<=sqrt(tol), break; end
    x0=x;
end
history=table(iter,err,residual);
end
