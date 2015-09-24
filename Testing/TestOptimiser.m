function [ result ] = TestOptimiser( )
%Testing pur ability to use optimisers
%Set of starting values
a0 = [2.0 2.0];
%Lower bounds
lba = [-50.0 -50.0];
%upper bounds
uba = [50.0 50.0];
%non linear constraints
nonlcon = @(x)TestNonLCon(x);
%create a problem object
problem = createOptimProblem('fmincon', 'objective',@SimpleTestFunction, 'x0', a0,'lb', lba, 'ub', uba, 'nonlcon', nonlcon);
result = fmincon(problem);
%result = 3;
end

