%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send msg to LMS 1xx

%% NOTES
% Set IP and Port in front end
%% Function Header
function RXT = sendTelegram (TXT)
global IP port
address=tcpip(IP, port, 'NetworkRole', 'client');

fopen(address);
fwrite(address,02); %STX
fwrite(address,TXT);
fwrite(address,03); %ETX
RXT = fread(address);
fclose(address);
end