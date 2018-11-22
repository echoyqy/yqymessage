function out =  Ch_eatimation(x)

global Walsh_matrix;  %---K*T的扩频矩阵P
global M_antenna;  %---基站天线根数；
% global SNR_Current;  %---当前的信噪比；
global Frame_Len;  %---帧长,即T的长度；
global pho;   %---设置功率分配因子；
global Ex ;   %---发射功率；
global G_matrix; %---产生M*1的G矩阵；
global Iter_num ;   %---接收机迭代次数
global K_ChannelDim; %---设置信道的维度，即K的长度；
%------------------------------
Y = reshape(x, [M_antenna,Frame_Len]);  %M根天线接收到的信号M*T；
Y_update = Y ;
for ii = 1:1:Iter_num
    % 解扩处理——更新Z；
    Z=(1/Frame_Len) * Y_update * Walsh_matrix;   
    %----使用简单的解扩思想-------------------------
%     H=pinv(G_matrix)*Z/(sqrt(pho*Ex));
    %---使用MMSE更新H-------------------------------------
    temp1 = Frame_Len * sqrt(pho*Ex)*K_ChannelDim;
    temp2 = (K_ChannelDim+(Frame_Len-K_ChannelDim)*pho)*Ex*G_matrix'*G_matrix;
    H=temp1 * ( pinv(temp2 + K_ChannelDim) ) * G_matrix' * Z; %---噪声功率为1，省略掉
    
    H=sqrt(2)/2*(sign(real(H))+1i*sign(imag(H)));  %---为什么不在这里纠正
    
    
    %---消除信道H的干扰
    Y_wave = Y - sqrt(pho*Ex) * G_matrix * H * Walsh_matrix.';
    
    
    
  %%-----------使用ZF检测s--------------------------
%   S_MMSE=  1/sqrt((1-pho)*Ex)  * pinv(G_matrix)*Y_wave;
%   S_MMSE=sqrt(2)/2*(sign(real(S_MMSE))+1i*sign(imag(S_MMSE)));  %---为什么不在这里纠正
%     
%-----------使用MMSE检测s--------------------------
    part1= sqrt((1-pho)*Ex);
    part2=((1-pho)*Ex)*G_matrix'*G_matrix+1;
    S_MMSE= part1*(pinv(part2))*G_matrix'*Y_wave;
S_MMSE=sqrt(2)/2*(sign(real(S_MMSE))+1i*sign(imag(S_MMSE)));  %---为什么不在这里纠正
    
%--------利用检测到的数据S更新Y---------------------------；
    Y_update = Y - sqrt((1-pho)*Ex) * G_matrix * S_MMSE;
    
end  
%-------------检测------------------------------
  
   
out =[H,S_MMSE].';
