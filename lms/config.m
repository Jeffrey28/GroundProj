%Clear Log
fclose('all');
delete('lmsLog.txt');
%Global Values
global IP port address log
IP = '192.168.0.46'; port = 2111; address=tcpip(IP, port, 'NetworkRole', 'client'); log=fopen('lmsLog.txt','w');

fprintf(log,'%13s \t %7s\n','Module','Success');