function isSPD(A)
% determine whether matrix is Symmetric Positive Definite
symmetric = issymmetric(A);
d = eig(A);
tol = length(d)*eps(max(d));
posdef = all(d > tol);
 
if symmetric == true && posdef == true
    disp('Matrix is symmetric positive definite.')
else
    disp('Matrix is not symmetric positive definite')
end
