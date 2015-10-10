fSpan = -pi/2:pi/99:pi/2;
%fSPan2 = horzcat(fSpan,fSpan);


%fSpan = -pi/2:(pi)/99:pi/2;

    
top = sqrt(1-0.9^2) *sin(fSpan);
bottom = 0.9 + cos(fSpan);
E = atan(top./bottom);
M = (E - 0.9*sin(E));
t =M*(sqrt((1.67*10^-11)*(2*10^30 + 6*10^24)/((1.49*10^11)^3)))^(-1);


% setting the constant to be one so M = t
plot(fSpan,t);

