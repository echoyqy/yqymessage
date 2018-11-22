clear; clc; close all;
warning off;

Frame_Len =4096;  %---����֡��,��T�ĳ��ȣ�
Sample_time =1;  %---simulinkģ�����Ƶ�ʣ�
simu_time=1*(Sample_time*Frame_Len*2);  %---���÷���ʱ�䣻
pho =0.2;   %---���ù��ʷ������ӣ�
K_ChannelDim=128;  %---�����ŵ���ά�ȣ���K�ĳ��ȣ�
M_antenna =128; %---���û�վ���߸�����
Iter_num =1; %---���ջ���������
support=32; %---֧�ż�����
n=8;



find_end = 0;
tt = 1
while find_end == 0
%---����walsh��Ƶ����
    Walsh_matrix = zeros(Frame_Len, K_ChannelDim);   %---��ʼ����Ƶ����
    
    temp = randint( K_ChannelDim,1,[1,Frame_Len-1]); %---������Ҫ��1��ԭ������������
    for iii=1:1:K_ChannelDim

        kkk=temp(iii) ;
        sim('Walsh_Code2.mdl');
        Walsh_matrix(:,iii)= walsh_code;

    end
    %---����walsh����������ԡ�
    TTT = Walsh_matrix'*Walsh_matrix; 
    count_TTT = length(find(TTT~=0))
     tt = tt+1

    if  count_TTT == K_ChannelDim;
        find_end = 1;
    end 
end



% ����Frame_Len���ȣ��޸�����ı������

save('Walsh_matrix4096.mat', 'Walsh_matrix');
disp('Congratulation you find the correct Walsh_matrix');



