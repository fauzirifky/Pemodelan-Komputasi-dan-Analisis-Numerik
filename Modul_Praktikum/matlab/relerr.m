function e = relerr(xnew,xold)
%RELERR Scaled relative change, safe when xnew is zero.
e = abs(xnew-xold)./max(1,abs(xnew));
end
