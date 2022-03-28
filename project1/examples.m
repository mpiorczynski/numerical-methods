format long

% Example 1
f = @(x, y) 1;
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
i = 4; % exact value of integral

% Example 2
f = @(x, y) x + y;
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
i = 0;


% Example 3
f = @(x, y) x .* y;
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
i = 0;

% Example 4
f = @(x, y) x.^2 + y.^2;
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
i = 8/3;

% Example 5 
f = @(x, y) x.^4 .* y.^5;
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
i = 0;

% Example 6
f = @(x, y) 1 ./ (x.^2 + y.^2);
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
i = Inf;

% Example 7 
f = @(x, y) cos(x).*cos(y);
xmin = -pi;
xmax = pi;
ymin = -pi;
ymax = pi;
i = 0;

% Example 8
f = @(x, y) (cos(x).^7).*(sin(y).^9);
xmin = -pi;
xmax = pi;
ymin = -pi;
ymax = pi;
i = 0;

%Example 9
f = @(x,y) log(x+y);
xmin = 0;
xmax = 1;
ymin = 0;
ymax = 1;
i = log(4) - 3/2;

% Example 10
f = @(x,y) exp(x+y);
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
i = -2 + 1 / exp(1)^2 + exp(1)^2;