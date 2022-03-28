function plot3d(f, xmin, xmax, ymin, ymax, n)
if (nargin < 6) 
    n = 100;
end 
x = linspace(xmin, xmax, n);
y = linspace(ymin, ymax, n);
[X, Y] = meshgrid(x, y);
Z = f(X, Y);
surf(X, Y, Z)
end