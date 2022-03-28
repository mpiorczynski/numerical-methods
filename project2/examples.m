% Przykład 1
p = 2;
A = generateBlockSPD(p)
b = ones(3*p, 1)
x = solveBlockCholesky(A, b)
x_true = linsolve(A, b)
cond_coeff = cond(A)
abs_error = abserror(x, x_true)
rel_error = relerror(x, x_true)

% Przykład 2
p = 5;
A = generateBlockSPD2(gallery('wilk', 5))
b = ones(3*p, 1)
x = solveBlockCholesky(A, b)
x_true = linsolve(A, b)
cond_coeff = cond(A)
abs_error = abserror(x, x_true)
rel_error = relerror(x, x_true)

% Przykład 3
p = 2;
A = generateBlockSPD2(gallery('minij', p))
b = ones(3*p, 1)
x = solveBlockCholesky(A, b)
x_true = linsolve(A, b)
cond_coeff = cond(A)
abs_error = abserror(x, x_true)
rel_error = relerror(x, x_true)

% Przykład 4
p = 2;
A = generateBlockSPD2(gallery('gcdmat', p))
b = ones(3*p, 1)
x = solveBlockCholesky(A, b)
x_true = linsolve(A, b)
cond_coeff = cond(A)
abs_error = abserror(x, x_true)
rel_error = relerror(x, x_true)

% Przykład 5
p = 5;
A = generateBlockSPD2(gallery('lehmer', p))
b = ones(3*p, 1)
x = solveBlockCholesky(A, b)
x_true = linsolve(A, b)
cond_coeff = cond(A)
abs_error = abserror(x, x_true)
rel_error = relerror(x, x_true)

% Przykład 6
p = 5;
A = generateBlockSPD2(gallery('moler', p))
b = ones(3*p, 1)
x = solveBlockCholesky(A, b)
x_true = linsolve(A, b)
cond_coeff = cond(A)
abs_error = abserror(x, x_true)
rel_error = relerror(x, x_true)

