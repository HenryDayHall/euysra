 function [totalThrust] = intergrateThrust(c,Lb,Ub)
 %this function intergrates the thrust so we can minimie it 
f=@(x) c(1)*x.^3 + c(2)*x.^2 + c(3)*x + c(4);
totalThrust = integral(f,Lb,Ub);
    

    



