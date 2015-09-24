function r1 = FindR1 (f, e, poleVec, semiAxis)
%As we never seem to use r2 this is now just about finding r1
%r1,r2 are distance from sail to larger and smaller primaries respectively

xComp = cos(f) + poleVec(1).*(1 + e.*cos(f))./(semiAxis.*(1 - e.^2));
yComp = sin(f) + poleVec(2).*(1 + e.*cos(f))./(semiAxis.*(1 - e.^2));

r1 = [xComp, yComp];