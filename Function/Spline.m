function [coefs] = Spline(numNodes,thrust,fSpan)
%belwo here is test data
% numNodes=5;
% thrust = [ 0, 0.9559, 0.0874, 0.0876, 0.0875, 0.0876];
% fSpan= [ 0   , 1.2566   , 2.5133   , 3.7699  ,  5.0265 ,   6.2832];
%use interp1 and specify spline is used in the method section 
%will need to create a vector which will be points inbetween the values in
%fspan which have been evaluated this will then interpolated by interp1.
%numNodesNew = (numNodes * 50);

%fSpanNew = 0:2*pi/(numNodesNew./2):2*pi;


%fspanNew is a vecotr containing the origional points and new x points
%we want interpolated
%interpResult = griddedInterpolant(thrust,fSpan);
%interpResult = spline(thrust',fSpan,fSpanNew);
%plot(interpResult,fSpanNew)

splineResult = spline(fSpan,thrust);
% splineGraph = spline(fSpan,[0,thrust,0],fSpanNew);
%Spline is now unpacked so we can intergate the spline to find out how much
%thrust was used over the orbital period
[~,coefs,~,~,~] = unmkpp(splineResult);
% % 
%  plot(fSpan,thrust,'ro');
%  hold on
%  plot(fSpanNew,splineGraph,'blue');



