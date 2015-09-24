function [fitresult, gof] = curveFitting(fSpan, thrust)
%CREATEFIT(FSPAN,THRUST)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : fSpan
%      Y Output: thrust
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.




%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( fSpan', thrust );

% Set up fittype and options.
ft = fittype( 'poly5' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'thrust vs. fSpan', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel fSpan
% ylabel thrust
% grid on


