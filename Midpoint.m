% Midpoint Method

% Input
a = 2; b = 6; h = 0.5; alpha = 1;
f = @(t, y) 1 + (t - y)^2.;
y = @(t) t + 1/(1 - t);

% Step 1
N = (b-a)/h;
t = zeros(N+1, 1);
w = zeros(N+1, 1);
M = 2; L = 2/3;
t(1) = a; w(1) = alpha;
fprintf('t \t\t\t w \t\t\t y \t\t\t Error\n')
fprintf('%f \t %f \t %f \t %f\n', t(1), w(1), y(t(1)), abs(w(1) - y(t(1))))

% Step 2
for i = 1:N
    w(i+1) = w(i) + h*f(t(i) + h/2, w(i) + (h/2)*f(t(i), w(i)));
    t(i+1) = a + i*h;
    error = abs(y(t(i+1)) - w(i+1));
    fprintf('%f \t %f \t %f \t %f\n', t(i+1), w(i+1), y(t(i)), error)
end

% Plot
plot(t, w, 'o', 'LineWidth', 3)

% Also plot the exact solution
hold on
num_plot = 100;
t_plot = zeros(num_plot+1,1);
y_plot = zeros(num_plot+1,1);
h_plot = (b-a)/num_plot;

t_plot(1) = a;
y_plot(1) = y(t(1));

for i = 1:num_plot
    t_plot(i+1) = a + i*h_plot;
    y_plot(i+1) = y(t_plot(i+1));
end

plot(t_plot, y_plot, 'LineWidth', 3);