function [ result ] = GradOmega( numX, numY, numZ, numMu)
%checked
%This ia a wrapper class of the symbolic grad omega, in ensures that the
%symbolic derivative is only calculated once

    persistent numericalGradOmega;
    if isempty(numericalGradOmega)
        numericalGradOmega = GradOmegaSymbolic();
    end
    result = numericalGradOmega(numX, numY, numZ, numMu);

end

