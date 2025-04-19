clear all; 
close all; 
clc;

f = @(x) x + cos(x);
x0 = -5.0;
x1 = 5.0;
maxIt = 50;
tol = 10^-10;

%Secant Method
for i = 1:maxIt
    x2 = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));
    fprintf('i = %d, x = %.9f\n', i, x2)
    if abs(x0 - x1) < tol
        break;
    end
    x0 = x1;
    x1 = x2;
end

