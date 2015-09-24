function [ thrust ] = ThrustAtStep( z, sailAngle, f, e, beta, massMod, mu,  poleVec, semiAxis)
%THRUSTATSTEP Calculates the total required thrust for the step we are at
%This is for flat orbit case so
dotZ = 0;
dDotZ = 0;
%Call all functions we will use
%(if we called them twice it would be less efficient)
x = XPos(f, z, e, poleVec, semiAxis);
y = YPos(f,z,e,poleVec, semiAxis);
dotX = DotXPos( f,z,dotZ,e,poleVec, semiAxis );
dotY = DotYPos( f,z,dotZ,e,poleVec, semiAxis );
dDotX = DdotXPos( f,z,dotZ, dDotZ,e,poleVec, semiAxis );
dDotY = DdotYPos( f,z,dotZ, dDotZ,e,poleVec, semiAxis );
gradOmega = GradOmega( x, y, z, mu);
r1 = FindR1(f, e, poleVec, semiAxis);
sailNorm = SailNormal(r1);

%Now we have all the stuff we need
xThrust = massMod.*(dDotX - 2.*dotY).*(1 + e.*cos(f)) - massMod.*gradOmega(1) - beta.*(1 - mu).*(cos(sailAngle).^2).*sailNorm(1)./norm(r1).^2;
yThrust = massMod.*(dDotY - 2.*dotX).*(1 + e.*cos(f)) - massMod.*gradOmega(2) - beta.*(1 - mu).*(cos(sailAngle).^2).*sailNorm(2)./norm(r1).^2;
zThrust = massMod.*(z).*(1 + e.*cos(f)) - massMod.*gradOmega(3);

thrust = sqrt(xThrust.^2 + yThrust.^2 + zThrust.^2);


end

