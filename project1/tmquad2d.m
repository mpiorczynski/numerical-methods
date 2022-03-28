function [q] = tmquad2d(f, xmin, xmax, ymin, ymax, nx, ny)
% Name: myquad2d
% Description: 
% Numerically evaluate double integrals of the function z = f(x, y) 
% over the retctangular region xmin ≤ x ≤ xmax and ymin(x) ≤ y ≤ ymax(x) 
% with the composite trapezoidal rule due to the variable x 
% and the composite midpoint rule due to the variable y.
% Input: 
% f - vectorized function to integrate, function handle
% xmin, xmax - limits of x integration, scalars
% ymin, ymax - limits of y integration, scalars
% nx - number of subintervals on X axis, scalar
% ny - number of subintervals on Y axis, scalar
% Output:
% q - calculated integral, scalar
% Example:
% q = tmquad2d(@(x, y) x.^2 + y.^2, -1, 1, -1, 1, 100, 100)

% default arguments
if (nargin < 6)
    nx = 100;
end
if (nargin < 7)
    ny = nx;
end

% check inputs 
assert(isscalar(xmin) && isscalar(xmax) && isscalar(ymin) && isscalar(ymax), 'Given limits of integration are not scalars')
assert(isscalar(nx) && isscalar(ny), 'Given numbers of subintervals are not scalars')

% compute width of interval on x and y axis
hx  = (xmax - xmin) / nx;
hy = (ymax - ymin) / ny;

% trapezoidal rule coefficents
trap_coeffs = hx / 2 .* [1, repmat(2, 1, nx-1), 1];

% midpoint rule coefficents
midp_coeffs = hy .* ones(1, ny);

% product rule coefficents
prod_coeffs = trap_coeffs .* transpose(midp_coeffs);

% grid
x = linspace(xmin, xmax, nx+1);
y = linspace(ymin + hy / 2, ymax - hy / 2, ny);
[X, Y] = meshgrid(x, y);

% values of f in grid points 
F = f(X, Y);

% value of integral
q = sum(prod_coeffs .* F, 'all');
end