function [e,Mp,T,a,semiAxis,poleVector, mu]=setEarth(Ms)
%Excentricity (unitless)
e=0.0167;
%Mass of the planet (kg)
Mp=5.972*10^24;
%Orbital period units of seconds 
%days in a year (according to nasa) * hours in a day * seconds in an hour
T=365.256*24*60*60;
%periapsis (assuming = perhelion) units of metres
a = 1.53*10^11;

%Semimajor axis (look up acutual value) (N.B. may have to do unit
%conversions in code) (units in m)
semiAxis = 149.6.*10.^9;

%Normalised vector along the pole  of the planet in initial stationary
%coordinates, has been calculated. Actual phisical value present.
poleVector = [-0.3869 0.0958 0.9171];

%Mu is the reduced mass, it is calculated 
mu = Ms.*Mp./(Ms + Mp);
