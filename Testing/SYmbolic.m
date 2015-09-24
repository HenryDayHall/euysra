% a = sym('a');
% b = sym('b');
% n = sym('n');
% f = symfun(sym('f(a)'), a);
% %d = diff(f, a);
% sum = f + b;
% %subs(d1, f, n);
% val = matlabFunction(sum, );
% %d1 = diff(sum, a);
% %subs(d1, D(f)(a), n);

%This works!!
% syms f(x,y) n;
% d = diff(f, x);
% sum = x + f;
% sum2 = subs(sum, f, n);
% val = matlabFunction(sum2)

%This works!!
syms f(x,y);
syms n;
d = diff(f, x);
sum = x + f;
sum2 = subs(sum, f, n);
val = matlabFunction(sum2)

