%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Consistant stream of OUTPUT
%TODO: Make function

%Command Structure: [SPC] is implicated
%[STX][CMD Type][Version][Device][Serial][Status][TCounter][SCounter][runTime][TXtime][Din Status][Dout Status][RES][ScanFreq]
%	[Measured Freq][Enco Pos][Enco Speed][Amount data][Data_ch][Pos][X][Y][Z][Xangle][Yangle][Zangle][angleType][DeviceName]
%		[LengthName][Name][Comment][LengthComment][comment][time][...][ETX]
%% Alt Values
%Read pg 31-33

%% Read Stream
global address;
while(1)
RXtelegram = fread(address);
delay(10);
end
%TODO: Timeout

%realize Values