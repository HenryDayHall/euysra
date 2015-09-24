function [N] = SailNormal (r1)
%N = vector of sail normal vectors
N=-r1./norm(r1);

%beta is sail lightness number it will vary with reue anomly
%beta = -1/1-mu *( dot(N,gradPosition)* (R1Mag)^4)/(dot(R1,N)^2);
%There is a suspician that beta should infact be treated as constant so 
%I have moved it over to the constants class