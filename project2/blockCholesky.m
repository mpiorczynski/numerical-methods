function [L_11, L_21, L_22, L_31, L_32, L_33] = blockCholesky(A_11, A_12, A_22, A_23, A_33)
% Name: blockCholesky
% Description:
% numerically calculates block Cholesky decomposition of symmetric 
% positive definite matrix block matrix A such that 
% A = [A_11 A_12 0; A_12^T A_22 A_23; 0 A_23^T A_33]
% Input: 
% A_11, A_12, A_22, A_23, A_33 - input matrices, matrices
% Output:
% L_11, L_21, L_22, L_31, L_32, L_33 - matrices such that A = L * L' and 
% L = [L_11 0 0; L_21 L_22 0; L_31 L_32 L_33], matrices 
% Example:
% [L_11, L_21, L_22, L_31, L_32, L_33] = blockCholesky([3.2663], [2.7407], [6.2922], [2.0382], [3.4665])

% check inputs 
[m_1, n_1] = size(A_11);
[m_2, n_2] = size(A_12);
[m_3, n_3] = size(A_22);
[m_4, n_4] = size(A_23);
[m_5, n_5] = size(A_33);

assert(m_1 == n_1)
assert(m_2 == n_2)
assert(m_3 == n_3)
assert(m_4 == n_4)
assert(m_5 == n_5)

% size of blocks
p = n_1;

% decomposition algorithm
L_11 = cholesky(A_11);
L_21 = forwardSubstitution(L_11, A_12)';
L_22 = cholesky(A_22 - L_21 * L_21');
L_31 = forwardSubstitution(L_11, zeros(p))';
L_32 = forwardSubstitution(L_22, A_23 - L_21 * L_31')';
L_33 = cholesky(A_33 - L_31 * L_31' - L_32 * L_32');

end