function [x, history] = jacobi(A, b, x0, tol, maxit)
%JACOBI Function: seluruh komponen baru memakai vector xold.
b=b(:); xold=x0(:); n=numel(b);
if ~isequal(size(A),[n n]) || numel(xold)~=n || tol<=0 || maxit<1
    error('Dimensi atau parameter tidak valid.');
end
if any(abs(diag(A))<=eps), error('Diagonal nol; susun ulang persamaan.'); end
xs=zeros(maxit,n); it=zeros(maxit,1); errs=zeros(maxit,1); res=zeros(maxit,1);
for k=1:maxit
    xnew=xold;
    for i=1:n
        idx=[1:i-1,i+1:n];
        xnew(i)=(b(i)-A(i,idx)*xold(idx))/A(i,i);
    end
    it(k)=k; xs(k,:)=xnew';
    errs(k)=max(relative_error(xnew,xold));
    res(k)=norm(b-A*xnew,inf);
    if errs(k)<=tol && res(k)<=tol, break; end
    xold=xnew;
end
x=xnew;
history=table(it(1:k),xs(1:k,:),errs(1:k),res(1:k),...
    'VariableNames',{'iter','x','err','residual'});
end
