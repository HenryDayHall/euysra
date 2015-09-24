function [ mass ] = MassFromThrust( nodeDuration, invEffic, massInit, thrustMag )
%Function checked! 15/2/2015
%MASSFROMTHRUST Takes the thrust at each step and the initial mass
%Returns the mass at each step
%For now we will assume this relationship is linear
%Thruster mag is assumed to be in the form:
%x1, y1, z1
%x2, y2, z2
%...
%xn, yn, zn

%Calculate the mass lost for a unit of thrust over one node of time
lossConstant = nodeDuration.*invEffic;


%the vector magnitude of the thrust (as opposed to the magnitude of the
%thrust in the , y and z directions indervidualy)
totalThrustMagSqud = zeros(size(thrustMag,1),1);
for i = 1:3
    for row = 1:size(thrustMag,1)
        totalThrustMagSqud(row) = thrustMag(row,i).^2;
    end
end
totalThrustMag = sqrt(totalThrustMagSqud);

%Cumulative thrust, first item is zero
cuThrust = zeros(length(totalThrustMag),1);
for i = 1:length(totalThrustMag)
    cuThrust(i+1) = totalThrustMag(i) + cuThrust(i);
end

%mass at step n = initial mass - cumulative thrust * lossConstant
mass = -cuThrust.*lossConstant + massInit;

end

