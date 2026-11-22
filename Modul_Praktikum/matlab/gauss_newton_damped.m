function [p,history] = gauss_newton_damped(model,Jfun,x,y,p0,tol,maxit)
%GAUSS_NEWTON_DAMPED Damped Gauss-Newton nonlinear least squares.
if nargin < 7, maxit = 100; end
if nargin < 6, tol = 1e-9; end
x=x(:); y=y(:); p=p0(:);
iter=zeros(maxit,1); step=zeros(maxit,1); sse=zeros(maxit,1);
alphaHist=zeros(maxit,1); condA=zeros(maxit,1);
for k=1:maxit
    r=y-model(p,x); r=r(:);
    J=Jfun(p,x);
    if size(J,1)~=numel(y) || size(J,2)~=numel(p)
        error('Ukuran J harus n-by-m: n observasi dan m parameter.');
    end
    A=J'*J; g=J'*r; condA(k)=cond(A);
    scale=max(1,trace(A)/numel(p));
    delta=(A+1e-10*scale*eye(numel(p)))\g;
    oldSSE=sum(r.^2); alpha=1;
    while alpha>=2^-12
        pTry=p+alpha*delta;
        rTry=y-model(pTry,x); rTry=rTry(:);
        if sum(rTry.^2)<oldSSE, break; end
        alpha=alpha/2;
    end
    pNew=p+alpha*delta;
    relStep=norm(pNew-p)/max(1,norm(pNew));
    p=pNew;
    iter(k)=k; step(k)=relStep; alphaHist(k)=alpha;
    rNew=y-model(p,x); rNew=rNew(:); sse(k)=sum(rNew.^2);
    if relStep<=tol, break; end
end
history=table(iter(1:k),step(1:k),sse(1:k),alphaHist(1:k),condA(1:k), ...
    'VariableNames',{'iter','step','sse','alpha','condJTJ'});
end
