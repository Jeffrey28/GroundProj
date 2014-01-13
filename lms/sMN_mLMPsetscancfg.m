%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Set Frequency and Resolution

%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][Scan Freq][Reserved][Angular Res][Start Angle][Stop Angle][ETX]

%% Alt Values
%Scan Frequency: [0x9C4: 25Hz; 0x1388: 50Hz]
%Angular Resoultion: [0x9C4: 25deg; 0x1388: 5deg] %NOTE!!! If changed...
%       CHANGE "LMPoutputRange"
%Start Angle: [0xFF F9 22 30 to 0x00 22 55 10]
%Stop Angle: [0xFF F9 22 30 to 0x00 22 55 10]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegram ='sMN mLMPsetscancfg +5000 +1 +5000 -450000 +2250000';
%%now to send telegram
RXtelegram = sendTelegram(telegram);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Receiver
%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][Error?][Angular Res][Start Angle][Stop Angle][ETX]

% Preset
Success = 48;
FREQError = 49;
RESError = 50;
RESscanError = 51;
SCANError = 52;
genError = 53;

%Grab "Error"
value = RXtelegram(21); %account for SPC & CMDtype 21is error location
if(isequal(value,Success))
    fprintf(log,'%14s \t %1s\n','sMN_mLMPsetscancfg','Y');
elseif(isequal(value,FREQError))
    fprintf(log,'%14s \t %1s\t %14\n','sMN_mLMPsetscancfg','N','Frequnecy');
elseif(isequal(value,RESError))
    fprintf(log,'%14s \t %1s\t %14\n','sMN_mLMPsetscancfg','N','Resolution');
elseif(isequal(value,RESscanError))
    fprintf(log,'%14s \t %1s\t %14\n','sMN_mLMPsetscancfg','N','Res and Scan');
elseif(isequal(value,SCANError))
    fprintf(log,'%14s \t %1s\t %14\n','sMN_mLMPsetscancfg','N','Scan Area');
elseif(isequal(value,genError))
    fprintf(log,'%14s \t %1s\t %14\n','sMN_mLMPsetscancfg','N','gen error');
else
    fprintf(log,'%14s \t %1s\t %14\n','sMN_mLMPsetscancfg','N','SHOULDNT HAPPEN');
    break
end
