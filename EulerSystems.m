% Euler's Method Systems

% Input
a = 0; b = 3; h = 0.05; N = b/h; 
alpha1 = 1; alpha2 = 0;
f1 = @(t, u1, u2) u2;
f2 = @(t, u1, u2) u1; 

% Step 1
t = zeros(N+1, 1);
w1 = zeros(N+1, 1);
w2 = zeros(N+1, 1);
t(1) = a; w1(1) = alpha1; w2(1) = alpha2;
fprintf('t \t\t\t w1 \t\t\t w2\n')
fprintf('%f \t %f \t %f\n', t(1), w1(1), w2(1))

% Step 2
for i = 1:N
    w1(i+1) = w1(i) + h*f1(t(i), w1(i), w2(i));
    w2(i+1) = w2(i) + h*f2(t(i), w1(i), w2(i));
    t(i+1) = a + i*h;
    fprintf('%f \t %f \t %f\n', t(i+1), w1(i+1), w2(i+1))
end

% Plot
figure()
plot(t, w1, 'o', 'LineWidth', 3)

% Also plot the exact solution
hold on
num_plot = 100;
t_plot = zeros(num_plot+1,1);
y_plot = zeros(num_plot+1,1);
h_plot = (b-a)/num_plot;

t_plot(1) = a;
y_plot(1) = alpha1;

plot(t_plot, y_plot, 'LineWidth', 3);
legend('Approx', 'Exact')
title('u1 vs w1')

% Plot
figure()
plot(t, w2, 'o', 'LineWidth', 3)

% Also plot the exact solution
hold on
num_plot = 100;
t_plot = zeros(num_plot+1,1);
y_plot = zeros(num_plot+1,1);
h_plot = (b-a)/num_plot;

t_plot(1) = a;
y_plot(1) = alpha2;

plot(t_plot, y_plot, 'LineWidth', 3);
legend('Approx', 'Exact')
title('u2 vs w2')

% Plot
figure()
plot(w1, w2, 'o', 'LineWidth', 3)

% Also plot the exact solution
hold on
num_plot = 100;
t_plot = zeros(num_plot+1,1);
y_plot = zeros(num_plot+1,1);
h_plot = (b-a)/num_plot;

t_plot(1) = alpha1;
y_plot(1) = alpha2;

plot(t_plot, y_plot, 'LineWidth', 3);
legend('Approx', 'Exact')
title('w1 vs w2')