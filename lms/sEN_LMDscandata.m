%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send permanent data
%TODO: Make function

%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][Start/Finish][ETX]

%% Alt Values
%Start/Finish: [START: 1; Stop: 0]

%% Setup
clc,clear
telegram ='sEN LMDscandata 1';
%%now to send telegram
RXtelegram = sendTelegram(telegram);

%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][Start/Finish][ETX]

% Preset
Stop = 48; %0 ascii
Start = 49; %1 ascii
RX_L = length(RXtelegram);

value = RXtelegram(RX_L-1);
if(isequal(value,Start))
    fprintf(log,'%14s \t %5s\n','sEN_LMDscandata','Start');
else
    fprintf(log,'%14s \t %5s\n','sEN_LMDscandata','Stop');
end

%Will now return stream