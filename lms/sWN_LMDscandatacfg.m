%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to configure data content for scan

%Command Structure:
%[STX][CMDType][SPC][CMD][SPC][Data Channel]...
%   [Remission][Resolution][Unit][Encoder][Position][Device Name]...
%       [Comment][Time][Output Rate][ETX]

%% Alt Values
%Data Channel: [CH1:0x0100; CH2:0x0200; CH1&2:0x0300]
%Remission: [No: 0x00; Yes: 0x01]
%Resolution: [8'b: 0x00; 16'b: 0x01]
%Encoder: [None: 0x0000; CH1: 0x0100]
%Position: [No: 0x00; Yes: 0x01]
%Device Name: [No: 0x00; Yes: 0x01]
%Comment: [No: 0x00; Yes: 0x01]
%Time: [No: 0x00; Yes: 0x01]
%Output Rate: [All Scans: 0x0001; Each 2nd scan: 0x0002]

%% Setup
clc,clear
global log
%Delclare telegram. See: INFO/Command Structure
telegram ='sWN LMDscandatacfg 01 00 1 1 0 00 00 0 0 0 0 +1';

%%now to send telegram
RXtelegram = sendTelegram(telegram);

%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMDType][SPC][CMD][SPC][ETX]

%Grab "Error?" checks to see both are identical
Success = [2,115,87,65,32,76,77,68,115,99,97,110,100,97,116,97,99,102,103,3];

if(isequal(RXtelegram,Success))
    fprintf(log,'%14s \t %1s\n','sWN_LMDscandatacfg','Y');
else
    fprintf(log,'%14s \t %1s\t %14\n','sMN_mLMPsetscancfg','Y','SHOULDNT HAPPEN');
end
