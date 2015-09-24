%Top level class
%Decided that at t=0 the planet is at its aphelion. 

%Pick a planet
planetNo = 3;
%Set the constants
[G, k, Ms, Mp, T, e, a, thrusterConst, invEffic, initialMass, numNodes, beta, semiAxis,poleVec, fSpan, mu] = Constants(planetNo);

%alpha = pi./2;

%call PeriodFunction
%Are we using the wrong axis (it shouldnt be periapsis)
t = PeriodFunction (e,Mp,Ms,a,k,fSpan);

%spline switch - set to 1 if you want spline or 0 if you dont
sSwitch = 1;
%sail angle at start/end switch - set to 1 if you want the sail angle at
%the end to be equal to the sail angle at the start, set to 0 if you wan
% it to be unconstrained
aSwitch = 1;

%Create a function handle for mass from thrust that can be passed to the
%OdeSolver. Reduces the number of variables equired by the ode solver
%massEquation = @(thrustMag)MassFromThrust( nodeDuration, invEffic, massInit, thrustMag);

%Create a function handle for the OdeSolver. 
%odeSolver = @(thrustMag, xInit)ThrustOdeSolver(e,mu,alpha,thrustMag, massEquation, xInit, numNodes, fSpan, beta);


% Try the total thrust for some z
% z = 3;
% sailAngle = ones(numNodes, 1);
% n = TotalThrust(z, sailAngle, numNodes, initialMass, invEffic, e, beta, mu, poleVec, semiAxis, Mp, Ms, k,fSpan);

thrustFunction = @(inputs)TotalThrust(inputs(1), inputs(2:end), numNodes, initialMass, invEffic, e, beta, mu, poleVec, semiAxis, Mp, Ms, k, fSpan, sSwitch);
result = FlatOrbitOptimiser(thrustFunction, numNodes, aSwitch);
%     %verySimple = @(x)VerySimple(x);

% x = ones(numNodes + 1, 1);
% x(1) = 3;
% thrustFunction(x)
% z=0.5;
% sailAngle = ones(numNodes, 1);
%thrustOverTime = ThrustRoundOrbit(z,sailAngle, numNodes, initialMass, invEffic, e, beta, mu, poleVec, semiAxis, Mp, Ms, k, fSpan);
%weightedThrust = WeightedThrustOverTime( thrustOverTime, fSpan, numNodes );
%splinedThrust = Spline(numNodes, thrustOverTime, fSpan);
