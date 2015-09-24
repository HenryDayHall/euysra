function [ val ] = SimpleTestFunction( a )
%This is a function designed to test understanding of the optimiser
%'a' should be a 2 vector
val = 2.*a(1).^4 + a(2).*a(1) - a(2);
end

