% P48 Q2 MATLAB����
x = [0.4, 0.5, 0.6, 0.7, 0.8];
fx = [-0.916291,-0.693147,-0.510826,-0.356675,-0.223144];

% ���Բ�ֵ
qPoint = 0.54;
linearItpl = interp1(x,fx, qPoint);

% ���β�ֵ
% ��ֵ��x=0.5,0.6,0.7
quadraticItplLeft = lagrangepoly(x(2:4),fx(2:4),qPoint);
quadraticItplRight = lagrangepoly(x(1:3),fx(1:3),qPoint);

fprintf('ln(%.2f)���Բ�ֵ�Ľ���ֵ:%f\n', qPoint, linearItpl);
fprintf('++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('ʹ�ò�ֵ��:')
disp(x(1:3));
fprintf('ln(%.2f)���β�ֵ�Ľ���ֵ:%f\n', qPoint, quadraticItplRight)
fprintf('++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('ʹ�ò�ֵ��:')
disp(x(2:4))
fprintf('ln(%.2f)���β�ֵ�Ľ���ֵ:%f\n', qPoint, quadraticItplLeft)



