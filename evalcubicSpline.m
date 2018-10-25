function [value] = evalcubicSpline(xQuery,M, x, f)
% ��������������ʽ�����ֵ
h = diff(x);
% �ҵ�xQuery���ڵ�����
intIdx = find((xQuery - x)>=0,1,'last');
if intIdx == length(x)
    intIdx = intIdx - 1;
end
hInt = h(intIdx);
lDelta = xQuery - x(intIdx);
rDelta = x(intIdx+1) - xQuery;
flDelta = f(intIdx) - M(intIdx)* hInt^2/6;
frDelta = f(intIdx+1) -  M(intIdx+1)* hInt^2/6;
value = M(intIdx) * rDelta^3/(6*hInt) + M(intIdx+1)*(lDelta)^3/(6*hInt)...
    + flDelta * rDelta / hInt + frDelta* lDelta / hInt;
end