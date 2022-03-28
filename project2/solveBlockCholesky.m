function [x] = solveBlockCholesky(A, b)
% Name: solveBlockCholesky
% Description:
% numerically solves system of linear equations Ax = b
% using block Cholesky method with symmetric 
% positive definite matrix block matrix A such that 
% A = [A_11 A_12 0; A_12^T A_22 A_23; 0 A_23^T A_33].
% A - coefficients matrix, matrix , matrix 
% b - vector of constant terms, vector 
% Output:
% x - solution vector, vector
% Example:
% A = [0.6788    0.1536   -0.5871   -0.1328         0         0;
%      0.1536    0.5322   -0.1328   -0.4603         0         0;
%     -0.5871   -0.1328    2.2502    0.5091   -0.4155   -0.0940;
%     -0.1328   -0.4603    0.5091    1.7641   -0.0940   -0.3257;
%           0         0   -0.4155   -0.0940    3.9045    0.8835;
%           0         0   -0.0940   -0.3257    0.8835    3.0612];
% b = ones(6, 1);
% x = solveBlockCholesky(A, b)


% check input
[m, n] = size(A);
assert(m == n)

% size of blocks
p = n / 3;

% dividing matrix into blocks
A_11 = A(1:p, 1:p);
A_12 = A(1:p, p+1:2*p);
A_22 = A(p+1:2*p, p+1:2*p);
A_23 = A(p+1:2*p, 2*p+1:end);
A_33 = A(2*p+1:end, 2*p+1:end);

% dividing vector into blocks
b_1 = b(1:p);
b_2 = b(p+1:2*p);
b_3 = b(2*p+1:end);

% block Cholesky decomposition
[L_11, L_21, L_22, L_31, L_32, L_33] = blockCholesky(A_11, A_12, A_22, A_23, A_33);

% solving system of linear equations
% Ax = b -> L L^T = b -> L^T y = b and L x = y

% L^T y = b -> block forward substitution
y_1 = forwardSubstitution(L_11, b_1);
y_2 = forwardSubstitution(L_22, b_2 - L_21*y_1);
y_3 = forwardSubstitution(L_33, b_3 - L_31*y_1 - L_32*y_2);

% L x = y -> block backward substitution
x_3 = backwardSubstitution(L_33', y_3);
x_2 = backwardSubstitution(L_22', y_2 - L_32'*x_3);
x_1 = backwardSubstitution(L_11', y_1 - L_21'*x_2 - L_31'*x_3);

x = [x_1; x_2; x_3];
end

