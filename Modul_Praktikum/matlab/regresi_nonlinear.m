function [param, history] = regresi_nonlinear(xdata, ydata, param0, model, Jac, tol, maxit)
%REGRESI_NONLINEAR Damped Gauss-Newton for nonlinear least squares.
% model(x,p) -> n predictions; Jac(x,p) -> n-by-number_of_parameters.
% Uses QR-based Z\D rather than explicit inv(Z'*Z).
x=xdata(:); y=ydata(:);param=param0(:);
n=numel(x);m=numel(param);
if numel(y)~=n || n<m || tol<=0 || maxit<1
    error('Dimensi data, parameter, tol, atau maxit tidak valid.');
end
if ~all(isfinite([x;y;param])), error('Data/parameter tidak terhingga.');end
it=zeros(maxit,1); ps=zeros(maxit,m); errs=zeros(maxit,1);
sse=zeros(maxit,1); steps=zeros(maxit,1);
for k=1:maxit
    yfit=model(x,param); yfit=yfit(:); D=y-yfit;
    Z=Jac(x,param);
    if ~isequal(size(Z),[n,m]) || numel(yfit)~=n
        error('Model harus nx1 dan Jacobian harus nxp.');
    end
    if rank(Z)<m, error('Jacobian parameter rank-deficient; ganti tebakan/model.');end
    delta=Z\D;                               % GN: Z'*Z*delta=Z'*D
    oldSSE=sum(D.^2);alpha=1; accepted=false;
    for bt=1:24
        trial=param+alpha*delta;
        pred=model(x,trial); pred=pred(:);
        newSSE=sum((y-pred).^2);
        if isfinite(newSSE) && newSSE<=oldSSE+1e-14*max(1,oldSSE)
            accepted=true;break
        end
        alpha=alpha/2;
    end
    if ~accepted
        % At an optimum the step may no longer lower SSE in floating point.
        trial=param;newSSE=oldSSE;alpha=0;
    end
    it(k)=k;ps(k,:)=trial';
    errs(k)=max(relative_error(trial,param));
    sse(k)=newSSE;steps(k)=alpha;
    param=trial;
    if errs(k)<=tol || alpha==0,break;end
end
history=table(it(1:k),ps(1:k,:),errs(1:k),sse(1:k),steps(1:k),...
    'VariableNames',{'iter','param','errs','SSE','alpha'});
end
