%���źŽ�����Ƶ����
function out =CSI_Gen(x)
global Walsh_matrix;  %---T*K��walsh�����P
Spread_CSI=(x.'*Walsh_matrix.').';  %---��Ƶ, �õ�T*1������
out=Spread_CSI;













