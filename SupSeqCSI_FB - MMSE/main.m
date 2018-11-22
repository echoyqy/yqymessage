clear all;
clc;
close all;

global K_ChannelDim; %---设置信道的维度，即K的长度；
global Walsh_matrix;  %---K*T的扩频矩阵P
global M_antenna;  %---基站天线根数；
global SNR_Current;  %---当前的信噪比；
global Frame_Len;  %---帧长,即T的长度；
global pho;   %---设置功率分配因子；
global Ex ;   %---发射功率；
global Iter_num ;   %---接收机迭代次数
global support;%----支撑集的长度
global n;%----支撑集的长度
global kkk;%----支撑集的长度
%---参数设置----
Frame_Len =1024;  %---设置帧长,即T的长度；
Sample_time =1;  %---simulink模块采样频率；
simu_time=1e3*(Sample_time*Frame_Len*2);  %---设置仿真时间；
pho =0.2;   %---设置功率分配因子；
K_ChannelDim=64;  %---设置信道的维度，即K的长度；
M_antenna =64; %---设置基站天线根数；
Iter_num =1; %---接收机迭代次数
support=32; %---支撑集长度
n=8;
tic
%---产生walsh扩频矩阵；
Walsh_matrix = zeros(Frame_Len, K_ChannelDim);   %---初始化扩频矩阵；
temp = randint( K_ChannelDim,1,[1,Frame_Len]);
% % for iii=1:1:K_ChannelDim
% %     tic
% %     kkk=temp(iii) ;
% %     sim('Walsh_Code2.mdl');
% %     Walsh_matrix(:,iii)= walsh_code;
% %     toc
% % end


load('Walsh_matrix1024.mat', 'Walsh_matrix');
% A=Walsh_matrix'*Walsh_matrix;
% B=length(find(A~=0));
SNR=-5;
for jj= 1:1:length(SNR);
    SNR_Current =SNR;
    Ex = 10^(0.1*SNR_Current);
    sim('data.mdl')
end


