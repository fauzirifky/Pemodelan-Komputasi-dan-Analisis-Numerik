function I = trap_simpson(f,a,b,n)
%TRAP_SIMPSON Backward-compatible wrapper for Simpson 1/3.
I = simpson_comp(f,a,b,n);
end
