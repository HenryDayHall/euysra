function GradOmega = GradOmegaSymbolic()
%This calculates grad Omega symbolicaly
    x = sym('x');
    y = sym('y');
    z = sym('z');
    mu = sym('mu');
    omega = 0.5*(x^2+y^2+z^2) + (1-mu)/((x+mu)^2+y^2+z^2)^0.5 + mu/((x+mu-1)^2+y^2+z^2)^0.5;
    symGradient = gradient(omega,{'x','y','z'});
    GradOmega = matlabFunction(symGradient, 'vars', {'x','y','z','mu'});
end

