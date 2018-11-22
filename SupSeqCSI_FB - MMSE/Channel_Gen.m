


function out =  Channel_Gen(x)
global G_matrix; %---产生M*1的G矩阵；
global M_antenna;  %---基站天线根数；
global Frame_Len;  %---帧长,即T的长度；
G_matrix= sqrt(0.5) * ( randn(M_antenna,1) + 1i*randn(M_antenna,1) );  %---产生上行信道； M*1 --产生G矩阵；
data = G_matrix*x.';  %---数据过无线信道，数据data为M*T的矩阵；
noise = sqrt(0.5) * ( randn(M_antenna,Frame_Len) + 1i*randn(M_antenna,Frame_Len) ); % ---根据当前的SNR产生噪声；
out_temp = data+noise;
% out_temp = data+0;
out = reshape(out_temp, [M_antenna*Frame_Len,1]);











