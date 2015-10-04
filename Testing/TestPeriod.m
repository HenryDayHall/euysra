function [ t ] = TestPeriod( )
%TESTPERIOD Summary of this function goes here
%   Detailed explanation goes here
%Pick a planet
planetNo = 3;
%Set the constants
[G, k, Ms, Mp, T, e, a, thrusterConst, invEffic, initialMass, numNodes, beta, semiAxis,poleVec, fSpan, mu] = Constants(planetNo);
fSpan = 0:pi/1000:pi;

t = PeriodFunction (G,e,Mp,Ms,semiAxis,fSpan);
plot(t,fSpan);

end

