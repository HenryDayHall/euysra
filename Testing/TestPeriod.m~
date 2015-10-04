function [ t ] = TestPeriod( )
%TESTPERIOD Summary of this function goes here
%   Detailed explanation goes here
%Pick a planet
planetNo = 3;
%Set the constants
[G, k, Ms, Mp, T, e, a, thrusterConst, invEffic, initialMass, numNodes, beta, semiAxis,poleVec, fSpan, mu] = Constants(planetNo);
fSpan = -pi/2:pi/1000:pi*4;

t = PeriodFunction (G,e,Mp,Ms,semiAxis,fSpan);
plot(fSpan, t);

end

