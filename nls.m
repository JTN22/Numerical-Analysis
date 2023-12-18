% Nonlinear shooting method using Midpoint method
% Initialization
clear all
clc
a = 0; % Set as left endpoint
b = 2; % Set as right endpoint
h = 0.2; % Step size
alpha = 0;
beta = -4;
k = 0;
m = 10;
tol = 0.0001;
% Exact solution
y_exact = @(x) (1/6)*(x^3)*exp(x) - (5/3)*x*exp(x) + 2*exp(x) - x - 2;
xx = a:h:b;
N = length(xx);
z1 = 1;
z2 = 2;
% Define the ODEs
f1 = @(x, u1, u2) u2; % y = u1, z = u2 = y'
f2 = @(x, u1, u2) 2*u2 - u1 + x*exp(x) - x;
% Initialize arrays
w1 = zeros(1, N);
w2 = zeros(1, N);
v1 = zeros(1, N);
v2 = zeros(1, N);
while (k <= m)
    % Midpoint method for w1 and w2
    w1(1) = alpha;
    w2(1) = z1;
    for i = 2:N
        x_mid = xx(i-1) + h/2;
        w1_mid = w1(i-1) + (h/2) * f1(xx(i-1), w1(i-1), w2(i-1));
        w2_mid = w2(i-1) + (h/2) * f2(xx(i-1), w1(i-1), w2(i-1));
        w1(i) = w1(i-1) + h * f1(x_mid, w1_mid, w2_mid);
        w2(i) = w2(i-1) + h * f2(x_mid, w1_mid, w2_mid);
    end

    % Midpoint method for v1 and v2
    v1(1) = alpha;
    v2(1) = z2;
    for i = 2:N
        x_mid = xx(i-1) + h/2;
        v1_mid = v1(i-1) + (h/2) * f1(xx(i-1), v1(i-1), v2(i-1));
        v2_mid = v2(i-1) + (h/2) * f2(xx(i-1), v1(i-1), v2(i-1));
        v1(i) = v1(i-1) + h * f1(x_mid, v1_mid, v2_mid);
        v2(i) = v2(i-1) + h * f2(x_mid, v1_mid, v2_mid);
    end

    % Update z3
    z3 = z2 - ((v1(N) - beta) * (z2 - z1)) / (v1(N) - w1(N));

    if (abs(w1(N) - beta) < tol)
        break;
    end
    k = k + 1;
    z1 = z2;
    z2 = z3;
end
if (k > m)
    error('Method did not converge');
end
% Midpoint method for final w1 and w2
w1(1) = alpha;
w2(1) = z3;
for i = 2:N
    x_mid = xx(i-1) + h/2;
    w1_mid = w1(i-1) + (h/2) * f1(xx(i-1), w1(i-1), w2(i-1));
    w2_mid = w2(i-1) + (h/2) * f2(xx(i-1), w1(i-1), w2(i-1));
    w1(i) = w1(i-1) + h * f1(x_mid, w1_mid, w2_mid);
    w2(i) = w2(i-1) + h * f2(x_mid, w1_mid, w2_mid);
end
% Plotting the actual solution versus the approximate solution
x_values = a:h:b;
y_actual = arrayfun(y_exact, x_values);
figure;
subplot(3, 1, 1);
plot(x_values, y_actual, 'b-', 'LineWidth', 2);
hold on;
plot(xx, w1, 'r--', 'LineWidth', 1.5);
xlabel('x');
ylabel('y');
legend('Actual Solution', 'Approximate Solution');
title('Nonlinear Shooting Method');
grid on;
% Plotting the error
yex = zeros(1, N );
err = zeros(1, N );
for i = 1:N
    x = a + (i - 1) * h;
    yex(i) = y_exact(x);
    err(i) = abs(w1(i) - yex(i));
end
subplot(3, 1, 3);
plot(x_values, err, 'm-', 'LineWidth', 1.5);
xlabel('x');
ylabel('Error');
title('Error');
grid on;