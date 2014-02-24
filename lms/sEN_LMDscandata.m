%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send permanent data
%TODO: Make function

%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][Start/Finish][ETX]

%% Alt Values
%Start/Finish: [Start: 1; Stop: 0]

%% Setup
clc,clear
global log

fprintf(log,'%17s\n','Starting Data Log');
telegram ='sEN LMDscandata 1';
    
%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMD Type][Version][Device][Serial][Status][TCounter][SCounter][runTime][TXtime][Din Status][Dout Status][RES][ScanFreq]
%	[Measured Freq][Enco Pos][Enco Speed][Amount data][Data_ch][Pos][X][Y][Z][Xangle][Yangle][Zangle][angleType][DeviceName]
%		[LengthName][Name][Comment][LengthComment][comment][time][...][ETX]

%while(1)
    RXtelegram = sendTelegram(telegram);
    %fprintf(log,'%151d\n',RXtelegram);
    pause(10)
%end
fclose(log);

% Preset
% Stop = 48; %0 ascii
% Start = 49; %1 ascii
% RX_L = length(RXtelegram);
% 
% value = RXtelegram(RX_L-1);
% if(isequal(value,Start))
%     fprintf(log,'%14s \t %5s\n','sEN_LMDscandata','Start');
% else
%     fprintf(log,'%14s \t %5s\n','sEN_LMDscandata','Stop');
% end

%Will now return stream
