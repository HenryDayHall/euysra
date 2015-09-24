function [ c, ceq ] = FlatOrbitConstraints( inputs , aSwitch)
%FLATORBITCONSTRAINTS 
%Vector of things that need to be less than 0
c(1) = -1;

%set to defult (ifaSwitch = false)
ceq = 0;

%vector of things that must be equal to 0
if(aSwitch)
    %the first sail angle must equal the last one
    ceq(1) = inputs(2) - inputs(length(inputs));
end

end

