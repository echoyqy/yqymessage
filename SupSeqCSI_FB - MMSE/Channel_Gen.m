


function out =  Channel_Gen(x)
global G_matrix; %---����M*1��G����
global M_antenna;  %---��վ���߸�����
global Frame_Len;  %---֡��,��T�ĳ��ȣ�
G_matrix= sqrt(0.5) * ( randn(M_antenna,1) + 1i*randn(M_antenna,1) );  %---���������ŵ��� M*1 --����G����
data = G_matrix*x.';  %---���ݹ������ŵ�������dataΪM*T�ľ���
noise = sqrt(0.5) * ( randn(M_antenna,Frame_Len) + 1i*randn(M_antenna,Frame_Len) ); % ---���ݵ�ǰ��SNR����������
out_temp = data+noise;
% out_temp = data+0;
out = reshape(out_temp, [M_antenna*Frame_Len,1]);











