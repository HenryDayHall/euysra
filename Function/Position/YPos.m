function [ val ] = YPos(  f,z,e,poleVec, semiAxis , mu, Mp )
%YPOS The position of y as a function of f(true anomoaly) and z
%this function will return a unitless quantity. Pole vector needs to have
%units of length.
muDim = mu./Mp;
val = muDim + z.*(1 + e.*cos(f)).*(-poleVec(1).*sin(f) + poleVec(2).*cos(f))./(poleVec(3).*semiAxis.*(1 - e.^2));

end

