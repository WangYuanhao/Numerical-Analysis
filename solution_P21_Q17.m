% P21 Q17 ��֤MATLAB����
clc;clear;close all
% ��������
iters = 100;
% Ԥ����洢������������
xUpd = zeros(iters, 2);
err = zeros(iters, 2);
% ��ȷ��
xPrc = (sqrt(5) - 1)/2;
% ��ʼֵ
xInit = 1;
omiga = 7/25;

xUpd_iter = xInit;
xUpd_relax = xInit;
for i = 1:iters
    
    % ������ʽx_k = 1/(1+x_k)
    xUpd(i,1) = 1 /(1+ xUpd_iter);
    err(i,1) = abs(xUpd(i,1) - xPrc);
    % �ɳڷ�
    xUpd(i, 2) = omiga * xUpd_relax + (1 - omiga)/(1+xUpd_relax);
    err(i,2) = abs(xUpd(i,2) - xPrc);
    
    % ���� 
    xUpd_iter = xUpd(i, 1);
    xUpd_relax = xUpd(i, 2);
end

figure('color','white')
plot(1:iters, err(:,1),'-o', 'lineWidth',2,'markerSize',2);
hold on
plot(1:iters, err(:, 2),'-s', 'lineWidth', 2,'markerSize',2)
l = legend('$x_{k}=\frac{1}{1+x_{k}}$','relaxation scheme');
set(l,'Interpreter','Latex');
xlabel('iterations')
ylabel('|x_{k}-x_{*}|')
grid on
