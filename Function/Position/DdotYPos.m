function [ val ] = DdotYPos( f,z,dotZ, dDotZ,e,poleVec, semiAxis )
%DDOTZPOS acceleration in the y direction

dDotZCoeff = (1 + e.*cos(f)).*(poleVec(2).*cos(f) - poleVec(1).*sin(f));

dotZCoeff = 2*((1 + e.*cos(f)).*(-poleVec(1).*cos(f) - poleVec(2).*sin(f))...
    - e.*sin(f).*(poleVec(2).*cos(f) - poleVec(1).*sin(f)));

zCoeff = -e.*cos(f).*(poleVec(2).*cos(f) - poleVec(1).*sin(f))...
    + (e.*cos(f) + 1).*(poleVec(1).*sin(f) - poleVec(2).*cos(f))...
    - 2.*e.*sin(f).*(-poleVec(1).*cos(f) - poleVec(2).*sin(f));

factor = (1./(poleVec(3).*semiAxis.*(1 - e.^2)));

val = factor.*(dDotZ.*dDotZCoeff + dotZ.*dotZCoeff + z.*zCoeff);

end

