function [ c,ceq ] = TestNonLCon( x )
%These are non liner constraints to be used with the TestOptimiser
c(1) = x(2) - 15;
c(2) = 5.*x(1) -  10;

ceq = 0;

end

