function [X] = generateBlockSPD2(S)
% generate a 3*p x 3*p symmetric positive definite matrix

A = generateTriSPD(3);
X = kron(A, S);