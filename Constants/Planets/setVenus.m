function [e,Mp,T,a,semiAxis,poleVector,mu]=setVenus(Ms)
%Excentricity (unitless)
e=0.0067;
%Mass of the planet (kg)
Mp=4.8676*10^24;
%Orbital period units of seconds 
%days in a year (according to nasa) * hours in a day * seconds in an hour
T=224.701*2802.0*60*60;
%periapsis (assuming = perhelion) units of metres
a = 1.09*10^11;
%Mu is the reduced mass, it is calculated 
mu = Ms.*Mp./(Ms + Mp);

%Semimajor axis of the planet (currently not correct number)
semiAxis = 100;

%Normalise vector along the pole  of the planet in initial stationary
%coordinates at t = 0 (currently not correct number
poleVector = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)];