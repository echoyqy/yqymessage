%对信号进行扩频处理
function out =CSI_Gen(x)
global Walsh_matrix;  %---T*K的walsh码矩阵P
Spread_CSI=(x.'*Walsh_matrix.').';  %---扩频, 得到T*1的数据
out=Spread_CSI;













