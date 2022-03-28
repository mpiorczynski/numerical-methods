function [X] = generateBlockSPD(p)
% generate a symmetric positive definite 3*p x 3*p matrix 

A = generateTriSPD(3);
B = generateSPD(p);
X = kron(A, B);