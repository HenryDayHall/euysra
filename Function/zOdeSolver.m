function [F,x] = zOdeSolver(z0, zdot0,numNodes)

%solves the ODE for the case where z varies. x an y are solved analytically
 zInit = [z0, zdot0];
 %zInit is the array of inital condition for z and zdot
 
 fspan=0:2*pi/numNodes:2*pi;
 %fspan is the array of true anomlie where the ode will be numerically
 %evaluated at.
 
 [F,x] = ode45(@problem,fspan,zInit);
 
 function [DX] = problem (x,numX, numY, numZ, numMu,r1,f, e, poleVec, semiAxis)
step =int64(f./(2*pi/(numNodes-1))) ;%cant have one node step will evaluate to 0
  
[GradOmegaNow]=GradOmega(numX, numY, numZ, numMu);
[Nnow] = SailNormal(r1);
[R1] = FindR1(f, e, poleVec, semiAxis);
R1MagNow = norm(R1);
 %beta is now taken to be constant
DX1=massModifier(step).*x(2);
DX2=massModifier(step).*(1/(1+e*cos(f)) * (thrustMag(step,3) + GradOmegaNow(3) + beta*(1-mu)*((cos(alpha)^2)*Nnow(3))/(R1MagNow^2))) + 2*x(2);

DX=[DX1; DX2];
        
    end
end

        
 
 