function I = boole_comp(f,a,b,n)
%BOOLE_COMP Composite Boole rule on a uniform grid.
if n < 4 || mod(n,4) ~= 0
    error('Aturan Boole komposit memerlukan n kelipatan 4.');
end
h = (b-a)/n;
x = linspace(a,b,n+1);
y = f(x);
I = 0;
for j = 1:4:n
    I = I + 2*h/45 * ...
        (7*y(j) + 32*y(j+1) + 12*y(j+2) + 32*y(j+3) + 7*y(j+4));
end
end
