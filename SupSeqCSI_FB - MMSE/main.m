clear all;
clc;
close all;

global K_ChannelDim; %---�����ŵ���ά�ȣ���K�ĳ��ȣ�
global Walsh_matrix;  %---K*T����Ƶ����P
global M_antenna;  %---��վ���߸�����
global SNR_Current;  %---��ǰ������ȣ�
global Frame_Len;  %---֡��,��T�ĳ��ȣ�
global pho;   %---���ù��ʷ������ӣ�
global Ex ;   %---���书�ʣ�
global Iter_num ;   %---���ջ���������
global support;%----֧�ż��ĳ���
global n;%----֧�ż��ĳ���
global kkk;%----֧�ż��ĳ���
%---��������----
Frame_Len =1024;  %---����֡��,��T�ĳ��ȣ�
Sample_time =1;  %---simulinkģ�����Ƶ�ʣ�
simu_time=1e3*(Sample_time*Frame_Len*2);  %---���÷���ʱ�䣻
pho =0.2;   %---���ù��ʷ������ӣ�
K_ChannelDim=64;  %---�����ŵ���ά�ȣ���K�ĳ��ȣ�
M_antenna =64; %---���û�վ���߸�����
Iter_num =1; %---���ջ���������
support=32; %---֧�ż�����
n=8;
tic
%---����walsh��Ƶ����
Walsh_matrix = zeros(Frame_Len, K_ChannelDim);   %---��ʼ����Ƶ����
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

