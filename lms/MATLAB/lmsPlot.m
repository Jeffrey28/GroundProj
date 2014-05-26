%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send msg to LMS 1xx

%% NOTES
% Set IP and Port in front end
%% Function Header
function lmsPlot (rho)

clf
theta=(10+[1:length(rho)]/2)*pi/180;
polar(theta,rho)
end