
hX = -100;
hY = -100;
e = 0.9;
a = 10000;
f= 0:pi/10000:2*pi;

x = zeros(20000,1);
y = zeros(20000,1);
for n = 1:20001
    x(n) = 1 + (1 + e.*cos(f(n))).*(cos(f(n)).*hX + sin(f(n)).*hY)./(a*(1-e.^2));
    y(n) =  (1 + e.*cos(f(n))).*(cos(f(n)).*hY - sin(f(n)).*hX)./(a*(1-e.^2));   
end

plot(x,y);
