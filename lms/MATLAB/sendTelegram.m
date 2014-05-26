%% INFO
%Use of SICK LMS 111
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send msg to LMS 1xx

%% NOTES
% Set IP and Port in front end

%% Function Header
function [RXT,ETX,dataStart] = sendTelegram (TXT)
global address
fwrite(address,02); %STX
fwrite(address,TXT);
fwrite(address,03); %ETX
output=zeros(300,1);
RXT=0;
i=0;
dataStart=0; %Where data start within telegram
while RXT~=3
    i=i+1;
    RXT = fread(address,1);
    output(i) = RXT;
    if output(i)==32&&output(i-1)==49&&output(i-2)==65 %Catch data size "0hA1" in this case
        if dataStart==0
            dataStart=i;
        end
    end
end
RXT = output(1:i);
ETX = length(RXT);
end