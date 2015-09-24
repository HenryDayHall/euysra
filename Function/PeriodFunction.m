%This function takes in the true anomaly and some parameters of the system
%and outputs the time (in some units) at that true anomaly
%Going to be usefull for calculating the change in mass
function [t] = PeriodFunction (e,Mp,Ms,semiAxis,k,f)

%The calulation is found on pg588 of theory of orbits
% it has been split into smaller terms
term1 = (k*sqrt(Mp + Ms))./((semiAxis^(3/2))*(1-e^2)^(3/2));
term2 = (e*sin(f))./((e^2 - 1)*(e*cos(f) + 1));
term3top = 2*atanh(((e - 1).*tan(f/2))./sqrt(e^2 - 1));
term3bottom = (e^2 - 1)^(3/2);
term3 = term3top./term3bottom;

t = (1/term1)*(term2 - term3);

%calculation of df/dt for comparison
diff = term1*(1 + e*cos(f)).^2;
%Here we label the axis and plot
hold on
xlabel('True anomaly in rads')
ylabel('Time in seconds')
plot(f,t);
plot(f,diff);

%for comparison
%plot(f,40*sin(f));

