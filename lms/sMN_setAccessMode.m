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
clc,clear
telegram ='sMN SetAccessMode 03 F4724744';
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








