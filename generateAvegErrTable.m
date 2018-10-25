function [aveErrTable] = generateAvegErrTable(x, f)

% ���ɾ�����
% x, f��x��ȡֵ�㣬��Ӧ����ֵf
pNum = length(x);
aveErrTable = zeros(pNum);
aveErrTable(:, 1) = f;
eff = 1e+5;
for j = 2:pNum
    for i = j:pNum
        if j > 2 && i == j
             aveErrTable(i,j) = round((eff*(aveErrTable(i, j-1) - aveErrTable(i-1, j-1))...
            / (x(i) - x(1))))/eff;
        else
        aveErrTable(i,j) = round(eff*(aveErrTable(i, j-1) - aveErrTable(i-1, j-1))...
            / (x(i) - x(i-(j-1))))/eff;
        end
      
    end
end
end

function [numValPrc] = evalPrc(numValue, eff)
numValPrc = round(eff*numValue)/eff;
end