function [G, k, Ms, Mp, T, e, a, thrusterConst, invEffic, initMass, numNodes, beta, semiAxis,poleVector, fSpan, mu] = Constants (planetNo)
%Gravitational constant (N*m^2*kg^-2)
G=6.673*10^-11;
%Mass of sun (kg)
Ms=2*10^30;
%Gauss' constant (s*m^(3/2)*kg^(-2))
k=8.169*10^-6;
%Thruster constant is the max power of the thruster (not currently used)
%(set to one arbitarly - idk what units)
thrusterConst = 1;
%InvEffic is 1/(efficiency of thruster) = (mass lost)/(power of thruster)
%(set to one arbitarly - idk what units)
invEffic = 1;
%chose a number of nodes
%First node = last node
numNodes = 8;
%Genrerate the set of true anomalies corrisponding to these nodes
fSpan = 0:2*pi./(numNodes-1):2*pi;
%we can use different none equally space which will make the polynomial interpolated spline much better
%fSpan = chebPts(numNodes); 
%Initial mass of the satilite
%(set to big num arbitarly - in slugs)
initMass = 1000000;
%Sail lightness number - this is not actualy a constant, but I'm hoping we
%can pretend that it is. Other papers seem to do that. (its probably close)
%Values bettween 0 and 0.05 realisticaly 
%see "Hybrid solar sail and solar electric propulsion for novel Earth
%observation missions"
%Dimensionless
beta = 0.05;
%Get the planet specific constants
switch planetNo
    case 1
        [e,Mp,T,a,semiAxis,poleVector, mu]=setMercury(Ms);
    case 2
       [e,Mp,T,a,semiAxis,poleVector, mu]=setVenus(Ms);
    case 3
        [e,Mp,T,a,semiAxis,poleVector, mu]=setEarth(Ms);
    case 4
        [e,Mp,T,a,semiAxis,poleVector, mu]=setMars(Ms);
end

     