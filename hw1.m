% ================================== %
% Bisection Method
% Tram Nguyen
% Jan 26, 2023
% ================================== %

f = @(x) x.^2 - 3;
x_vals = [-10:0.001:10.0];
y_vals = f(x_vals);
plot(x_vals, y_vals, 'LineWidth', 4)
hold on
grid on
set(gca, 'FontSize', 14)

a = 0.0;
b = 4.0;
counter = 0;
tol = 10^(-5);

for i = 1:100
    p = (a+b)/2;
    plot(p, 0, 'r*')
    FA = f(a);
    FB = f(b);
    FP = f(p);

    if (abs(FP) < tol)
        fprintf('\n i = %d a = %f b = %f p = %f\n', i, a, b, p)
        break;
    else
        if FA*FP > 0
            a = p;
            FA = FP;
        else
            b = p;
        end
    end
end
