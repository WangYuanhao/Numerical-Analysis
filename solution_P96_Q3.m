clear;clc;close all;
format long %��֤���㾫��
%% P90,��13
% f = @(x)x.^4 - 3*x.^3+2*x.^2-tan(x.*(x-2));
% transf = @(y)f(1+y./pi);
% % f = @(x)abs(x);
% N = 8;
% M = 4;
% visable = 1;
% [an, bn, M] = fftIntplt(transf, N, M, visable);

%% P96, Q3
fcos = @(x)x.^2.*cos(x);
N = 32;
M = 16;
[an, bn, M] = fftIntplt(fcos, N, M);


