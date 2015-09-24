function [ T,x , extdX1] = ODE45Test(  )
%testing ode 45....

%create some inital x values
%using the knowledge that x(1) should = -3*exp(-t) + 3
%let t = 0
xInit = [0 0];

%Give the range of t values we are intrested in
tSpan = 0:1:10;

[T,x] = ode45(@Problem, tSpan, xInit);

%The function is the system of equations we wish to solve for
    function DX = Problem(t,x)
      DX(1) = x(2);
      DX(2) = sin(10.*t) + 4.*x(1) - 5.*x(2);
      DX = DX.';
    end

%plot
plot(tSpan,x(:,1));


end

