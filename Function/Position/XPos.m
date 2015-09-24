function [ val ] = XPos( f, z, e, poleVec, semiAxis )
%XPOS The position of x as a function of f(true anomoaly) and z

val = 1 + z.*(1 + e.*cos(f)).*(poleVec(1).*cos(f) + poleVec(2).*sin(f))./(poleVec(3).*semiAxis.*(1 - e.^2));

end

