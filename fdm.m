% Finite Difference Method

f = @(x, y, z) 2*z - y + x*exp(x) - x;
yexact = @(x) 1/6*x^3*exp(x) - 5/3*x*exp(x) + 2*exp(x) - x - 2;
a = 0; %Input the left endpoint
b = 2; %Input the right endpoint
alpha = 0; %Input the initial condition
beta = -4; %Input the initial condition
h = 0.1; %Input the h
%Input the exact equation
yexact = @(x) 1/6*x^3*exp(x) - 5/3*x*exp(x) + 2*exp(x) - x - 2;
%Set the number of steps
N = ((b-a)/h) - 1;
x_values = a:h:b;
p = 2;
q = -1;
r = @(x) x*exp(x) - x;
A = zeros(N, N);
b_vec = zeros(N, 1);
A(1, 1) = 2 + h^2 * q;
A(1, 2) = -1 + (h/2) * p;
b_vec(1) = -h^2 * r(a + h) + (1 + (h/2) * p) * alpha;
for i = 2:N-1
x = a + i * h;
A(i, i-1) = -1 - (h/2) * p;
A(i, i) = 2 + h^2 * q;
A(i, i+1) = -1 + (h/2) * p;
b_vec(i) = -h^2 * r(x);
end
A(N, N-1) = -1 - (h/2) * p;
A(N, N) = 2 + h^2 * q;
b_vec(N) = -h^2 * r(b - h) + (1 - (h/2) * p) * beta;
w_values = [alpha; A\b_vec; beta];
for i = 1:N+2
x = a + (i-1) * h;
end

%Plotting the error
yex = zeros(1, N + 2);
err = zeros(1, N + 2);
for i = 1:N+2
x = a + (i - 1) * h;
yex(i) = yexact(x);
err(i) = abs(w_values(i) - yex(i));
end
figure()
plot(x_values, err, '*');
xlabel('x-axis');
ylabel('error-axis');
title('error vs x');
grid on;

% Computing the error of L1 norm
L1_norm = sum(err * h);
fprintf('The error of L1 norm: %.9f\n' , L1_norm);

% Computing the error of L2 norm
L2_norm = sqrt(sum(err.^2 * h));
fprintf('The error of L2 norm: %.9f\n' , L2_norm);