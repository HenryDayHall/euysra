function [ thrust ] = ThrustRoundOrbit(G, z, sailAngle, numNodes, initialMass, invEffic, e, beta, mu, poleVec, semiAxis, Mp,Ms, k, fSpan)
%CALCTHRUST This function will return the the thrust at each step
%Sail angle needs to be a vector
%fly at this height with this sail angle set.
%Vector of thrust at each step
thrust = zeros(numNodes,1);
%Previous thrust is used to calculate fule ussage bettween the nodes
%At the start it will be the thrust for f = 0;
thrust(1) = ThrustAtStep( z, sailAngle(1), fSpan(1), e, beta, 1, mu,  poleVec, semiAxis);
%consider i = 1 to be the starting node (f= 0), always calculate trust for
%node i + 1, as at t= 0 the thruster will have fired for 0 time therefor no
%fuel used.
for i=1:(numNodes -1);
    %calculate the time taken for the prevous node transition
    timeTaken = PeriodFunction(G,e,Mp,Ms,semiAxis,fSpan(i + 1)) - PeriodFunction(G,e,Mp,Ms,semiAxis,k,fSpan(i));
    massMod = (timeTaken.*thrust(i).*invEffic)./initialMass;
    thrust(i+1) = ThrustAtStep( z, sailAngle(i+1), fSpan(i+1), e, beta, massMod, mu,  poleVec, semiAxis);
end
%Deal with the last node
%dont need this?? Done in the for loop??
% timeTaken = PeriodFunction(e,Mp,Ms,semiAxis,k,fSpan(numNodes)) - PeriodFunction(e,Mp,Ms,semiAxis,k,fSpan(numNodes + 1));
% massMod = (timeTaken.*thrust(numNodes-1).*invEffic)./initialMass;
% thrust(numNodes) = ThrustAtStep( z, sailAngle(1), fSpan(numNodes + 1), e, beta, massMod, mu,  poleVec, semiAxis);


%So that we can see whats happening in the optinmiser
disp('The sail angle is');
disp(sailAngle);
disp('end sail angle -----------');
disp('The z coordinate');
disp(z);
disp('end z ------------------');
end

