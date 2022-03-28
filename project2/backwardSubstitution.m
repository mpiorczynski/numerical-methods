function [X] = backwardSubstitution(A, B)
% Name: backwardSubstitution
% Description:
% numerically solves system of linear equations AX = B
% with upper triangular matrix A using backward substitution algorithm
% Input: 
% A - coefficients matrix, matrix 
% B - vetor or matrix of constant terms, vector | matrix
% Output:
% X - solution, vector | matrix
% Example:
% A = [1 -2 1; 0 1 6; 0 0 1];
% b = [4; -1; 2];
% x = backwardSubstitution(A, b)

% check inputs
[m, n] = size(A);
assert(m == n)

[p, r] = size(B);
assert(p == n)

% initialization solution matrix
X = zeros(n, r);
X(n, :) = B(n, :) / A(n, n);

if n == 1
    return
end

% backward substitution algorithm 
for k  = n-1:-1:1
    X(k, :) = (B(k, :) - A(k, k+1:n)*X(k+1:n, :)) / A(k, k);
end
