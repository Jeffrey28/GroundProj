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
log=fopen('lmsLog.txt','a+');
fprintf(log,'%17s\n','Starting Data Log');
%telegram ='sEN LMDscandata 1';
telegram ='sRN LMDscandata';


%% Receiver
%code receive based on LIDAR output

%Note: message is received as dec values of ascii char
%Command Structure:
%[STX][CMD Type][Version][Device][Serial][Status][TCounter][SCounter][runTime][TXtime][Din Status][Dout Status][RES][ScanFreq]
%	[Measured Freq][Enco Pos][Enco Speed][Amount data][Data_ch][Pos][X][Y][Z][Xangle][Yangle][Zangle][angleType][DeviceName]
%		[LengthName][Name][Comment][LengthComment][comment][time][...][ETX]

    RXtelegram = sendTelegram(telegram);
    fprintf(log,'%14s \t %5s\n','sEN_LMDscandata','Start');
    
j=1;
k=1;
for i=122:183 %rfread returns count
    if(RXtelegram(i) ~= 32)
        charData(j) = char(RXtelegram(i));
        j=j+1;
    else
        catData = strcat(charData);
        data(k) = hex2dec(catData);
        j=1;
        %charData=0;
        k=k+1;
    end
end
lmsPlot(data);
fclose(log);
    
%% Log use
%     for i=1:length(RXtelegram)
%         if(RXtelegram(i) == 32)
%             fprintf(log,'\n');
%         else
%             fprintf(log,'%1s',RXtelegram(i));
%         end
%     end
    %fprintf(log,'%151d\n',RXtelegram);



