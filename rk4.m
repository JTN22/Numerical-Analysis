% RK4 Method Systems

% Input
a = 0; b = 4*pi; N = 1000; h = b/N; 
alpha1 = -1; alpha2 = 0;
f1 = @(t, u1, u2) u2;
f2 = @(t, u1, u2) -sin(u1); 

% Step 1
t = zeros(N+1, 1);
w1 = zeros(N+1, 1);
w2 = zeros(N+1, 1);
t(1) = a; w1(1) = alpha1; w2(1) = alpha2;
fprintf('t \t\t\t w1 \t\t\t w2\n')
fprintf('%f \t %f \t %f\n', t(1), w1(1), w2(1))

% Step 2
for i = 1:N
    t(i+1) = a + i*h;
    
    k11 = h*f1(t(i), w1(i), w2(i));
    k12 = h*f2(t(i), w1(i), w2(i));

    k21 = h*f1(t(i) + h/2, w1(i) + (k11)/2, w2(i) + (k12)/2);
    k22 = h*f2(t(i) + h/2, w1(i) + (k11)/2, w2(i) + (k12)/2);

    k31 = h*f1(t(i) + h/2, w1(i) + (k21)/2, w2(i) + (k22)/2);
    k32 = h*f2(t(i) + h/2, w1(i) + (k21)/2, w2(i) + (k22)/2);

    k41 = h*f1(t(i+1), w1(i) + k31, w2(i) + k32);
    k42 = h*f2(t(i+1), w1(i) + k31, w2(i) + k32);

    w1(i+1) = w1(i) + (k11 + 2*k21 + 2*k31 + k41)/6;
    w2(i+1) = w2(i) + (k12 + 2*k22 + 2*k32 + k42)/6;
    
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