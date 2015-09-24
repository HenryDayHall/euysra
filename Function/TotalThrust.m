function [ totalThrust ] = TotalThrust( z, sailAngle, numNodes, initialMass, invEffic, e, beta, mu, poleVec, semiAxis, Mp,Ms, k, fSpan, sSwitch)
%CALCTHRUST This function will return the cumulative thrust required to
%fly at this height and sail angle. It will use ThrustRoyund orbit then
%apply spline then intergrate the result.

%get the thrust at each step
thrust = ThrustRoundOrbit( z, sailAngle, numNodes, initialMass, invEffic, e, beta, mu, poleVec, semiAxis, Mp,Ms, k, fSpan);

totalThrust = 0;

%apply spline
%thrustSplined = Spline(numNodes,thrust,fSpan);
%[fitresult, ~] = curveFitting(fSpan, thrust);
% c=coeffvalues(fitresult);
% thrustSplined = spline(numNodes,thrust,fSpan);
%totalThrust = sum(thrust);
if(sSwitch)
    coeffs  = Spline(numNodes,thrust,fSpan);
    totalThrust= intergrateSpline(coeffs,fSpan);
else
    totalThrust = sum(thrust);
end
end

