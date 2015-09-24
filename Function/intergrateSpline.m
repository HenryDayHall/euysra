function [totalThrust] = intergrateSpline(coeffs,fSpan)
intergratedSpline = zeros(length(coeffs),1);
%Unpacks the coefficents from the spline function in order for them to be
%intergrated
for i=1:length(coeffs)
    for j=1:size(coeffs,2)
    coeffMatrix = zeros(length(coeffs),1);
    coeffMatrix(j) = coeffs(i,j);
    end
    intergratedSpline(i) = intergrateThrust(coeffMatrix,fSpan(i),fSpan(i+1));
end
%disp(intergratedSpline);
totalThrust=sum(intergratedSpline);
end