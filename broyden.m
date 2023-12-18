% Broyden Method

% Set the given f1(x1,x2) and f2(x1,x2)
F = @(x1,x2) [(x1)^2 + x2 - 11; x1 + (x2)^2 - 7];

% Set up the Jacobian matrix
J = @(x1,x2) [2*(x1),1;1,2*(x2)];

% Input
x = [-0.164;1];
tol = 1*10^(-7);
N = 1000;

% Method
A0 = J(x(1),x(2));
v = F(x(1),x(2));
A = inv(A0);
s = -A*v;
x = x + s;
i = 2;
fprintf('Iteration \t\t\t x1 \t\t\t x2 \t\t\t error\n');
fprintf(' 1 \t\t\t -0.164000000 \t\t 1.000000000\n');

% Loop to run Broyden's Method
while (i <= N)
    w = v;
    v = F(x(1), x(2));
    y = v - w;
    z = -A*y;
    p = -transpose(s)*z;
    u = transpose(transpose(s)*A);
    A = A + (s + z)*transpose(u)/p;
    s = -A*v;
    x = x+s;
    error = max(abs(s));

    % Display
    fprintf(' %d \t\t\t %.9f \t\t %.9f \t\t %.9f\n',i,x(1),x(2),error);
    if(error < tol) % stopping criteria
        fprintf('\nTotal number of iteration is: %d\n', i);
        fprintf('Solution after using Broyden method is: (%.9f, %.9f)\n',x(1),x(2));
        break;
    end
    % Set to run next iteration
    i = i + 1;
end