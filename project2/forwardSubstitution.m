function [X] = forwardSubstitution(A, B)
% Name: forwardSubstitution
% Description:
% numerically solves system of linear equations AX = B
% with lower triangular matrix A using forward substitution algorithm
% Input: 
% A - coefficients matrix, matrix 
% B - vector or matrix of constant terms, vector | matrix
% Output:
% X - solution, vector | matrix
% Example:
% A = [1 0 0; 1 1 0; 1 1 1];
% b = ones(3, 1);
% x = forwardSubstitution(A, b)

% check inputs 
[m, n] = size(A);
assert(m == n)

[p, r] = size(B);
assert(p == n)

% initialization solution matrix
X = zeros(n, r);
X(1, :) = B(1, :) / A(1, 1);

if n == 1
    return 
end

% forward substitution
for k  = 2:n
    X(k, :) = (B(k, :) - A(k, 1:k-1)*X(1:k-1, :)) / A(k, k);
end

end

