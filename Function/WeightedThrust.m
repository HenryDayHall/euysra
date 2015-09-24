function [ weightedThrustOverTime ] = WeightedThrust( thrustOverTime, fSpan, numNodes )
%This takes the thrust at each point and weights it according to how long
%it takes to get from the previous node to its node.
%as at the first 
weightedThrustOverTime(1) = zeros(numNodes);
for i = 2:numNodes;
    timeFromPrevious = PeriodFunction(e,Mp,Ms,semiAxis,k,fSpan(i)) - PeriodFunction(e,Mp,Ms,semiAxis,k,fSpan(i-1));
    weightedThrustOverTime(i) = thrustOverTime(i)*timeFromPrevious;
end


end

