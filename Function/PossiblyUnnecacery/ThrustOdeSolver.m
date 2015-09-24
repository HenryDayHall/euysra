
function [F,x,finalMass] = ThrustOdeSolver(e,mu,alpha,thrustMag, massEquation, xInit, numNodes, fSpan, beta) 
    %passed in ----------------------------------------------------------
    %e = excentricity
    %mu = dimensionless mass of the smaller primary
    %thrusterMag = the chosen thruster magnitudes (x,y,z) for each node
    %massEquation = function handle for the function that gives the mass at
    %each node from the thrust at each node
    %xInit = initial x possition
    %returns ---------------------------------------------------------------
    %F = true anomaly
    %x = [x,xdot,y,ydot,z,zdot]

    %N_0 is the initial conditions for the sail
    %M_0 is the inital conditions for the thruster
    %normal for the sail,thruster and height above the earth optimised.

    %Find the mass at each step from the thrust use
    mass = massEquation(thrustMag);
    %Get the final mass to return
    finalMass = mass(length(mass));

    %Do inital mass over curretn mass for each step
    massModifier = mass(1)./mass;

    [F,x]=ode45(@Problem,fSpan,xInit);
    %Function handle for GradOmega so we can call it for each time step.
    gradOmega = @GradOmega;

    function DX = Problem(f,x)
        %Work out which step we are at
        step = int64((numNodes.*f)./(2*pi));
        %Find the gradOmega step right now
        gradOmegaNow = gradOmega(x(1), x(3), x(5), mu);
        [r1Now, ~] = findR(x,mu);
        [Nnow] = SailNormal(gradPositionNow);
        DX=zeros(6,1);
        %thruster mag passed in as big array which will be optimised it will input
        %the values into the array.
        %!!!!!!!!!!!!!!I have removed some of the mass modifiers, is this correct??
        DX(1)= x(2);
        DX(2)=massModifier(step).*(1/(1+e*cos(f)) * (thrustMag(step,1)*thrusterConst + gradOmegaNow(1) + beta*(1-mu)*((cos(alpha)^2)*Nnow(1))/(r1Now^2))) + 2*x(4);
        DX(3)= x(4);
        DX(4)=massModifier(step).*(1/(1+e*cos(f)) * (thrustMag(step,2)*thrusterConst + gradOmegaNow(2) + beta*(1-mu)*((cos(alpha)^2)*Nnow(2))/(r1Now^2))) - 2*x(2);
        DX(5)= x(6);
        DX(6)=massModifier(step).*(1/(1+e*cos(f)) * (thrustMag(step,3)*thrusterConst + gradOmegaNow(3) + beta*(1-mu)*((cos(alpha)^2)*Nnow(3))/(r1Now^2))) - x(5);
        %Need to transpose the vector to return in correct format
        DX = DX.';
    end
end
