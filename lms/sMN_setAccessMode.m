%% INFO
%Use of SICK LMS 111
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Set Access Mode

%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][USRlvl][PSWRD][ETX]

%% Alt Values
%USRlvl: [02:Maintenance; 03:Auth Client; 04:Service]
%PSWRD: [main: B21ACE26; client: F4724744; Service: 81BE23AA]

%% Setup
function sMN_setAccessMode
log=fopen('lmsLog.txt','a+');
telegram ='sMN SetAccessMode 03 F4724744';
%%now to send telegram
[RXtelegram, ETX] = sendTelegram(telegram);


%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMD Type][SPC][CMD][SPC][ERROR?][ETX]

% Preset
Success = 49; %1 ascii

%Grab "Change user level success"
%Error value
if(isequal(RXtelegram(ETX-1),Success))
    fprintf(log,'%14s \t %1s\n','sMN SetAccessMode','Y');
else
    fprintf(log,'%14s \t %1s\n','sMN SetAccessMode','N');
end
end
