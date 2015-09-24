function [ val ] = DotYPos( f,z,dotZ,e,poleVec, semiAxis )
%DOTXPOS velocity in y direction as a function of z and f

val = (1./(poleVec(3).*semiAxis.*(1 - e.^2))).*(...
    (1 + e.*cos(f)).*(poleVec(2).*cos(f) - poleVec(1).*sin(f)).*dotZ...
    -  e.*sin(f).*(-poleVec(1).*sin(f) + poleVec(2).*cos(f)).*z...
    + (1 + e.*cos(f)).*(-poleVec(1).*cos(f) - poleVec(2).*sin(f)).*z);

end

