function [ result ] = FlatOrbitOptimiser( thrustFunction, numNodes, aSwitch )
%OPTIMISER Otimises the flat orbit case
%Inital guess, first value is z, subsequent values are sail angle at each
%node
initGuess = zeros(numNodes + 1,1);
%set the initial guess for sail angle to be pi/4
initGuess = initGuess + pi/4;
%set the initial guess for z
initGuess(1) = 0.00005;
%chose lower bounds, all of them will be zero (unless we decide the
%satalight cant eb in the earth)
lbG = zeros(numNodes + 1,1);
%chose upper bounds
ubG = zeros(numNodes + 1,1);
%This is the upper bound for sail angle (logical! dont change!)
ubG = ubG + pi/2;
%This is the upper bound for z (idk why idk what units)
ubG(1) = 5;
%nonlinear constraints just make the first sail angle equal the last one
nonlcon = @(inputs)FlatOrbitConstraints(inputs, aSwitch);
%Options for the optimiser
%possibly wrong
options = optimoptions(@fmincon, 'MaxIter', 200, 'FinDiffType',  'central', 'TolCon', 1e-5, 'UseParallel', 1);
%creat the problem object
problem = createOptimProblem('fmincon', 'objective',thrustFunction, 'x0', initGuess,'lb', lbG, 'ub', ubG, 'nonlcon', nonlcon, 'options', options);
result = fmincon(problem);



end

