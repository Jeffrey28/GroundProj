clear%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Frontend to all functions

%Notes: 
%Change IP and port here
%% Setup
clc,clear

%Prompt
fprintf('Welcome to LIDAR Communication frontend ~dwbennet@mtu.edu ~kd8bny@gmail.com')
fprintf('\nUse with LMS11x and LMS 15x \n')
fprintf('For use instructions see README.MD\n\n')

%Clear Log
fclose('all');
delete('lmsLog.txt');

%Global Values
global entry IP port address log
entry = 'na'; IP = '192.168.0.46'; port = 2111; address=tcpip(IP, port, 'NetworkRole', 'client'); log=fopen('lmsLog.txt','w');

fopen(address);
fprintf(log,'%13s \t %7s\n','Module','Success');


while(entry~=0)
    fprintf('Commands:\n\t 1:Set Scan\n\t 2:Get Scan\n\t 3:Settings\n\n 0:QUIT\n')
    entry = input('Command Entry:');
    if(entry==1)
        %Login/set modes
        sMN_setAccessMode
        sMN_mLMPsetscancfg
        sWN_LMDscandatacfg
        sWN_LMPoutputRange
        sMN_mEEwriteall
        sMN_Run
    
    elseif(entry==2)
        %Recieve datas
        fprintf('Try also sEM_**')
        %sRN_LMDscandata
        sEN_LMDscandata
    
    elseif(entry==3)
        address = input('IP address of LMS 1xx: ','s');
        port = input('Port of LMS 1xx: ');
        fprintf('%13s','%13s','IP Changed',address)
        fprintf('%13s','%13s','Port Changed',port)
    elseif(entry==0)
        break
    else
        fprintf('Please enter valid command')
        pause(1)
    end
    %Prep for new command
    entry = 'na';
    clc
    fprintf('Next Command?\n\n')
end
fclose('all');
fprintf('Thanks for using\n')