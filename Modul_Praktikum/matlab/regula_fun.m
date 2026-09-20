function [x, history] = regula_fun(f, a, b, tol, maxit)
%REGULA_FUN Formula xr berbeda, pembaruan interval sama seperti Biseksi.
if ~(isscalar(a)&&isscalar(b)&&a<b&&tol>0&&maxit>=1)
    error('Parameter interval/toleransi/iterasi tidak valid.');
end
fa=f(a); fb=f(b);
if fa == 0, x=a; history=table(0,a,0,0,'VariableNames',{'iter','x','err','residual'});return;end
if fb == 0, x=b; history=table(0,b,0,0,'VariableNames',{'iter','x','err','residual'});return;end
if ~isfinite(fa*fb) || fa*fb>0
    error('f(a) dan f(b) harus terhingga dan berlainan tanda.');
end
iter=zeros(maxit,1); xs=zeros(maxit,1); errs=inf(maxit,1); res=zeros(maxit,1);
xold=NaN;
for k=1:maxit
    den=fb-fa;
    if abs(den)<eps*max(1,abs(fa)+abs(fb))
        error('Penyebut Regula Falsi terlalu kecil.');
    end
    x=b-fb*(b-a)/den;                  % HANYA baris ini yang beda dari Biseksi
    fx=f(x);
    if ~isfinite(fx), error('Evaluasi fungsi tidak terhingga.'); end
    if k>1, err=relative_error(x,xold); else, err=Inf; end
    iter(k)=k; xs(k)=x; errs(k)=err; res(k)=abs(fx);
    if abs(fx)<=tol || (k>1 && err<=tol), break; end
    if fa*fx<0, b=x; fb=fx; elseif fa*fx>0, a=x; fa=fx; else, break; end
    xold=x;
end
history=table(iter(1:k),xs(1:k),errs(1:k),res(1:k),...
    'VariableNames',{'iter','x','err','residual'});
end
