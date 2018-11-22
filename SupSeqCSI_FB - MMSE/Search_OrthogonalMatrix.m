clear; clc; close all;
warning off;

Frame_Len =4096;  %---设置帧长,即T的长度；
Sample_time =1;  %---simulink模块采样频率；
simu_time=1*(Sample_time*Frame_Len*2);  %---设置仿真时间；
pho =0.2;   %---设置功率分配因子；
K_ChannelDim=128;  %---设置信道的维度，即K的长度；
M_antenna =128; %---设置基站天线根数；
Iter_num =1; %---接收机迭代次数
support=32; %---支撑集长度
n=8;



find_end = 0;
tt = 1
while find_end == 0
%---产生walsh扩频矩阵；
    Walsh_matrix = zeros(Frame_Len, K_ChannelDim);   %---初始化扩频矩阵；
    
    temp = randint( K_ChannelDim,1,[1,Frame_Len-1]); %---这里需要减1，原来代码忘记了
    for iii=1:1:K_ChannelDim

        kkk=temp(iii) ;
        sim('Walsh_Code2.mdl');
        Walsh_matrix(:,iii)= walsh_code;

    end
    %---测试walsh矩阵的正交性。
    TTT = Walsh_matrix'*Walsh_matrix; 
    count_TTT = length(find(TTT~=0))
     tt = tt+1

    if  count_TTT == K_ChannelDim;
        find_end = 1;
    end 
end



% 根据Frame_Len长度，修改这里的保存矩阵。

save('Walsh_matrix4096.mat', 'Walsh_matrix');
disp('Congratulation you find the correct Walsh_matrix');



