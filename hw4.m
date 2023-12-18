close; 
clear all; 
clc;

f = @(x) -556.6667*x.^3 + 185.49997*x.^2 - 8.883336*x + 2;
x = -0.1:0.1:0.3;
fx = f(x);
num_points = length(x);
x_ref = -7:0.001:7;
f_ref = f(x_ref);
plot(x_ref, f_ref, LineWidth=8);
hold on
scatter(x,fx, LineWidth=10);
n = length(x);
F = zeros(n,n);
F(:, 1) = fx';
for i = 1 : n-1
    for j = 1:i
        F(i+1, j+1) = (F(i+1, j) - F(i,j)) / (x(i+1) - x(i-j+1));
    end
end
disp(F);

y = P(x_ref, x, F);
hold on
plot(x_ref, y, LineWidth=4);
legend("f(x)", "P(x)");

function y = P(x, p, F)
n = length(x);
y = zeros(n, 1);
x_minus_xi = x' - p;
basis = ones(n, 1);
for i = 1:size(F, 1)
    y = y + F(i, i) * basis;
    basis = basis .* x_minus_xi(:, i);
end
y = y';
end