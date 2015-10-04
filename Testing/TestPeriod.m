function [ t ] = TestPeriod( f )
%TESTPERIOD Summary of this function goes here
%   Detailed explanation goes here
%Pick a planet
planetNo = 3;
%Set the constants
[G, k, Ms, Mp, T, e, a, thrusterConst, invEffic, initialMass, numNodes, beta, semiAxis,poleVec, fSpan, mu] = Constants(planetNo);

t = PeriodFunction (G,a,e,Mp,Ms,semiAxis,k,f);


end

