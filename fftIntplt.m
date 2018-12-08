function [an, bn, M] = fftIntplt(f, N, M, visable)
% �Ժ���f��N����ʹ��M�����Ƕ���ʽ���в�ֵ
% ���룺
%   f:����ֵ������������[-pi, pi]
%   N:N���Ⱦ��xj = -pi + 2*pi*j/N, j=0,...,N-1
%   M:���Ƕ���ʽ�Ľ�����Ҫ��2*M  <= N
%   visable: �Ƿ�����������ͼ��0�������1�����Ĭ��
%            ֵΪ1
% �����
%   an: 1 x N, ����an(1:M+1)ΪM�����Ƕ���ʽ������ϵ��
%   bn: 1 x N,����bn(1:M+1)ΪM�����Ƕ���ʽ������ϵ��
%   M:���Ƕ���ʽ�Ľ�
% ����ʵϰ��P95 Q3���÷�ʽ
%   fcos = @(x)x.^2.*cos(x);
%   N = 32;
%   M = 16;
%  [an, bn, M] = fftIntplt(fcos, N, M);
format long

if nargin < 4
    visable = 1;
end

if 2*M > N
    M = floor(N/2);
end

j = 0:N-1;
x = -pi+j.*2*pi/N;
f = f(x);

% ���ٸ���Ҷ�任
c = fft(f);

an = 2/N*real(c.*exp(-1i.*j.*pi));
bn = -2/N*imag(c.*exp(-1i.*j*pi));

if visable == 1
    figure()
    scatter(x, f)
    hold on
    xfit = -pi:0.01:pi;
    evalf = eval_trifunc(xfit, an, bn, M);
    plot(xfit, evalf)
    legend('��ֵ��',strcat(num2str(M),'�����Ƕ���ʽ��ֵ����'))
    grid on
end

end

