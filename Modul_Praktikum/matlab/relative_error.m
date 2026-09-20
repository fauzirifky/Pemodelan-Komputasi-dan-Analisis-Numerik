function e = relative_error(xnew, xold)
%RELATIVE_ERROR Scaled relative change (dimensionless, NOT percent).
% Safe when xnew = 0; supports vectors and arrays elementwise.
e = abs(xnew-xold)./max(1,abs(xnew));
end
