function [ output_args ] = FuleUsed( input_args )
%FULEUSED Summary of this function goes here
%   Detailed explanation goes here

%Cumulative thrust
cuThrust = zeros(length(x),1);
for i = 1:length(x)
    cuThrust(i+1) = thrust(i) + cumuThrust(i);
end

disp(boo);


end

