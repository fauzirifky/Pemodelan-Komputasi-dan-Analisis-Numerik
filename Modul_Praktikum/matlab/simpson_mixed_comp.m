function I = simpson_mixed_comp(f,a,b,n)
%SIMPSON_MIXED_COMP Simpson 1/3 + Simpson 3/8 strategy for uniform n.
if n < 1 || fix(n) ~= n
    error('n harus bilangan bulat positif.');
end
if n == 1
    I = trap_comp(f,a,b,1);
    return
end
if mod(n,2) == 0
    I = simpson_comp(f,a,b,n);
    return
end
h = (b-a)/n;
m = n - 3;
I = 0;
if m > 0
    c = a + m*h;
    I = I + simpson_comp(f,a,c,m);
else
    c = a;
end
I = I + 3*h/8 * ...
    (f(c) + 3*f(c+h) + 3*f(c+2*h) + f(c+3*h));
end
