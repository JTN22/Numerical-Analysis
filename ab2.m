% AB-2 Method

% Input
a = 0; b = 10; h = 0.1; alpha = 1;
f = @(t, y) sin(t) - y;

% Step 1
N = (b-a)/h;
t = zeros(N+1, 1);
w = zeros(N+1, 1);
t(1) = a; w(1) = alpha;
fprintf('t \t\t\t w\n')
fprintf('%f \t %f\n', t(1), w(1))

% Step 2
t(2) = t(1) + h;
w(2) = 0.9099979169;
fprintf('%f \t %f \n', t(2), w(2))

% Step 3
for i = 2:N
    w(i+1) = w(i) + (3*h*f(t(i), w(i)))/2 - (h*f(t(i-1), w(i-1)))/2;
    t(i+1) = a + i*h;
    fprintf('%f \t %f \n', t(i+1), w(i+1))
end

% Plot
plot(t, w, 'o', 'LineWidth', 3)
xlabel('t')
ylabel('w')
title('Graph of AB-2 at h = 0.1')
