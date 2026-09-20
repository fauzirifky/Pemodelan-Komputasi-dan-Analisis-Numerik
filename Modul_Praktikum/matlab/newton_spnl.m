function [x, history] = newton_spnl(F, Jac, x0, tol, maxit)
%NEWTON_SPNL Newton multivariabel; F dan Jac diberikan dari driver.
x=x0(:); n=numel(x);
if tol<=0 || maxit<1, error('Toleransi/maxit harus positif.'); end
it=zeros(maxit,1); xs=zeros(maxit,n); errs=zeros(maxit,1); res=zeros(maxit,1);
for k=1:maxit
    fk=F(x); Jk=Jac(x);
    if numel(fk)~=n || ~isequal(size(Jk),[n,n]) || ~all(isfinite(Jk(:)))
        error('Ukuran/nilai F atau Jacobian tidak sesuai.');
    end
    if rcond(Jk)<1e-12
        error('Jacobian singular/hampir singular: ganti tebakan awal.');
    end
    dx=-Jk\fk(:);
    xnew=x+dx;
    it(k)=k;xs(k,:)=xnew';
    errs(k)=max(relative_error(xnew,x));
    res(k)=norm(F(xnew),inf);
    if ~isfinite(res(k)), error('Residual tidak terhingga.'); end
    x=xnew;
    if errs(k)<=tol && res(k)<=tol,break;end
end
history=table(it(1:k),xs(1:k,:),errs(1:k),res(1:k),...
    'VariableNames',{'iter','x','err','residual'});
end
