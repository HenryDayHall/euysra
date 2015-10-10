%This function takes in the true anomaly and some parameters of the system
%and outputs the time (in some units) at that true anomaly
%Going to be usefull for calculating the change in mass
%Returns time in seconds!!!!!!!
function [t] = PeriodFunction (G,e,Mp,Ms,semiAxis,f)

%This calculates the time values for each f between -pi/2 & pi/2.
%We're calling this the start seg
function tInStartSeg = timeSegment(G,e,Mp,Ms,semiAxis,f)
eccAnomaly = atan(sqrt(1-e^2).*sin(f)./(e+cos(f)));
meanAnomaly = eccAnomaly -e.*sin(eccAnomaly);
tInStartSeg = sqrt((semiAxis^3)./(G.*(Mp + Ms))).*meanAnomaly;
end

% The number of segments that have been passed post start seg segment
segmentNumber=floor(f./pi + 1/2);
% The time height of the start seg
tStop  = timeSegment(G,e,Mp,Ms,semiAxis,pi/2);
% The angle of f, shifted back to the start segment
fInStartSeg = f-(segmentNumber.*pi);
% total time passed after number of pies crossed
t = timeSegment(G,e,Mp,Ms,semiAxis,fInStartSeg) + tStop.*2.*segmentNumber;

end

