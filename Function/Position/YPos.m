function [ val ] = YPos(  f,z,e,poleVec, semiAxis  )
%YPOS The position of y as a function of f(true anomoaly) and z
val = 1 + z.*(1 + e.*cos(f)).*(-poleVec(1).*sin(f) + poleVec(2).*cos(f))./(poleVec(3).*semiAxis.*(1 - e.^2));

end

