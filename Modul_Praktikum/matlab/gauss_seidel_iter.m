function [x,history]=gauss_seidel_iter(A,b,x0,tol,maxit)
n=length(b); x=x0; iter=[]; err=[]; residual=[];
for k=1:maxit
    xold=x;
    for i=1:n
        if abs(A(i,i))<eps, error('Diagonal A memuat nol.'); end
        s1=A(i,1:i-1)*x(1:i-1);
        s2=A(i,i+1:n)*xold(i+1:n);
        x(i)=(b(i)-s1-s2)/A(i,i);
    end
    e=norm(x-xold,inf)/max(1,norm(x,inf)); r=norm(A*x-b,inf);
    iter(end+1,1)=k; err(end+1,1)=e; residual(end+1,1)=r;
    if e<=tol && r<=sqrt(tol), break; end
end
history=table(iter,err,residual);
end
