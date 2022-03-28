function [L] = cholesky(A)
% Name: cholesky
% Description:
% numerically calculates Cholesky decomposition of symmetric positive definite matrix A
% Input: 
% A - input matrix, matrix 
% Output:
% L - lower triangular matrix such that A = L * L', matrix 
% Example:
% L = cholesky([1 0 1; 0 2 0; 1 0 3])

% check inputs 
[m, n] = size(A);
assert(n == m)

L = zeros(n);

% Cholesky decomposition algorithm
for k = 1:n
    L(k, k) = sqrt(A(k, k) - sum(L(k, 1:k-1).^2));
    for i = k+1:n
        L(i, k) = (A(i, k) - sum(L(i, 1:k-1).*L(k, 1:k-1))) / L(k, k);
    end
end 
end
