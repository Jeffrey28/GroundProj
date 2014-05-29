%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to configure data content for scan

%Command Structure:
%[STX][CMDType][SPC][CMD][SPC][Data Channel]...
%   [Remission][Resolution][Unit][Encoder][Position][Device Name]...
%       [Comment][Time][Output Rate][ETX]

%% Alt Values
%Data Channel: [CH1: 01 00; CH2: 02 00; CH1&2: 03 00]
%Remission: [No: 0; Yes: 1]
%Resolution: [8'b: 0; 16'b: 1]
%Unit: [0]
%Encoder: [None: 00 00; CH1: 01 00]
%Position: [No: 0; Yes: 1]
%Device Name: [No: 0; Yes: 1]
%Comment: [No: 0; Yes: 1]
%Time: [No: 0; Yes: 1]
%Output Rate: [All Scans: +1; Each 2nd scan: +2]

%% Setup
clc,clear
global log
log=fopen('lmsLog.txt','a+');
%Delclare telegram. See: INFO/Command Structure
telegram ='sWN LMDscandatacfg 01 00 0 1 0 00 00 1 0 0 0 +1';

%%now to send telegram
[RXtelegram, ETX] = sendTelegram(telegram);

%% Logger

fprintf(log,'%14s \t %1s\n','sWN_LMDscandatacfg','Y');
fprintf(log,char(RXtelegram'));
