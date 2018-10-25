function [fvalue] = newtonIntpt(xQuery, x, aveErrTable, p)
% ţ�ٲ�ֵ����ʽ������P(xQuery)��ֵ
% pΪ����ʽ����
if p < 0 || p > length(x) - 1
    error('p shoud be smaller than lenght(x) and larger than 0')
end
delta = xQuery - x;
polyTerm = cumprod(delta);
constTerm = diag(aveErrTable);
fvalue = [1, polyTerm(1:p)]*constTerm(1:p+1);
end