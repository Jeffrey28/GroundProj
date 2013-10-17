%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send msg to LMS 1xx

%% NOTES
% Set IP and Port in front end
%% Function Header
function readT = sendTelegram (msg)
global IP port
echoudp('off')
echoudp('on',2111)
address = udp(IP, port);
set(address,'Timeout',30);
fopen(address);

%Combines all seperate cells to one value to send
newMSG = msg(1);
for(i=2:length(msg))
    newMSG = strcat(newMSG,msg(i));
end

fwrite(address,msg{i})
fread(address)
    
    
    
    
    
fclose(address)
echoudp('off')
end