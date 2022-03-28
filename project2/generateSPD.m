function A = generateSPD(n)
% generate a radnom symmetric positive definite  n x n matrix

% generate a random n x n matrix
A = rand(n,n); 

% construct a symmetric matrix
A = 0.5*(A+A');

% since A(i,j) < 1 by construction and a symmetric diagonally dominant matrix
% is symmetric positive definite, which can be ensured by adding nI
A = A + n*eye(n);