function [A] = generateTriSPD(n)
% generate a random tridiagonal symmetric positive definite n x n matrix;
b = randn(1, n-1);
a = [abs(b), 0] + [0, abs(b)] + abs(randn(1,n));
A = diag(b,-1) + diag(a) + diag(b,1);