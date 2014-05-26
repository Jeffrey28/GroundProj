%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Configure measurement angle of the output scan

%Command Structure:
%[STX][MSG length][CMD Type][SPC][CMD][SPC][Status Code]...
%   [Angle Res][Start Angle][Stop Angle][ETX]

%% Alt Values
%Angular Resoultion: [+2500: 25deg; +5000: 5deg] %NOTE!!! DO NOT CHANGE!!!
%       To change edit: "mLMPsetscancfg"
%Start Angle: [-450000 to +2250000]
%Stop Angle: [-450000 to +2250000]

%% Setup
clc,clear
global log
log=fopen('lmsLog.txt','a+');
%Delclare telegram. See: INFO/Command Structure
telegram ='sWN LMPoutputRange 1 +5000 +100000 +900000';

%%now to send telegram
[RXtelegram, ETX] = sendTelegram(telegram);


%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMDType][SPC][CMD][SPC][ETX]

%Grab "Error?" checks to see both are identical
Success = [2,115,87,65,32,76,77,80,111,117,116,112,117,116,82,97,110,103,101,3];

if(isequal(RXtelegram,Success))
    fprintf(log,'%14s \t %1s\n','sWN_LMPoutputRange','Y');
else
    fprintf(log,'%14s \t %1s\t %14\n','sWN_LMPoutputRange','Y','SHOULDNT HAPPEN');
end