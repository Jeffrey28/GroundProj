%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Save parameters permanent 
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%Command Structure:
%[Start text][MSG length][CMD Type][SPC][CMD][CHKSUM]

%% Setup
clc,clear
%Delclare telegram. See: INFO/Command Structure
telegram ='sMN mEEwriteall';

%%now to send telegram
RXtelegram = sendTelegram(telegram);

%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][ERROR?][ETX]

% Preset
Error = 48; %0 ascii
Success = 49; %1 ascii
RX_L = length(RXtelegram);

%Grab "Change user level success"
value = RXtelegram(RX_L-1); %Error value
if(isequal(value,Success))
    fprintf('Success\n')
else
    fprintf('Error in Change user level\n')
end
pause(10)
