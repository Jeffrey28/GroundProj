%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Configure measurement angle of the output scan

%Command Structure:
%[STX][MSG length][CMD Type][SPC][CMD][SPC][Status Code]...
%   [Angle Res][Start Angle][Stop Angle][ETX]

%% Alt Values
%Angular Resoultion: [0x9C4: 25deg; 0x1388: 5deg] %NOTE!!! DO NOT CHANGE!!!
%       To change edit: "mLMPsetscancfg"
%Start Angle: [0xFF F9 22 30 to 0x00 22 55 10]
%Stop Angle: [0xFF F9 22 30 to 0x00 22 55 10]

%% Setup
clc,clear
%Delclare telegram. See: INFO/Command Structure
telegram ='sWN LMPoutputRange 1 1388 0 DBBA0';

%%now to send telegram
RXtelegram = sendTelegram(telegram);


%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMDType][SPC][CMD][SPC][ETX]

%Grab "Error?" checks to see both are identical
Success = [2,115,87,65,32,76,77,80,111,117,116,112,117,116,82,97,110,103,101,3];

if(isequal(RXtelegram,Success))
    fprintf('Success')
else
    fprintf('Strange error....passed')
end
pause(10)