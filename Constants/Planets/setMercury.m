function [e,Mp,T,a,semiAxis,poleVector,mu]=setMercury(Ms)
%Excentricity (unitless)
e=0.205630;
%Mass of the planet (kg)
Mp=3.301*10^23;
%Orbital period units of seconds 
%days in a year (according to nasa) * hours in a day * seconds in an hour
T=87.969*4222.6*60*60;
%periapsis (assuming = perhelion)units of metres
a = 7.05*10^10;

%Mu is the reduced mass, it is calculated 
mu = Ms.*Mp./(Ms + Mp);

%Semimajor axis of the planet (currently not correct number)
semiAxis = 100;

%Normalise vector along the pole  of the planet in initial stationary
%coordinates at t = 0 (currently not correct number
poleVector = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)];