% Newton's method

% Given function
f1 = @(x1,x2) (x1)^2 + x2 -11;
f2 = @(x1,x2) x1 + (x2)^2 - 7;

% Partial Derivative
df1dx1 = @(x1,x2) 2*(x1);
df1dx2 = @(x1,x2) 1;
df2dx1 = @(x1,x2) 1;
df2dx2 = @(x1,x2) 2*(x2);

% Input
m0 = -0.164;
n0 = 1;
tol = 10^-7;
N = 1000;
n = 2;
x = [m0; n0];
i = 1;

fprintf('Iteration \t\t\t x1 \t\t\t x2 \t\t\t error\n');
fprintf(' 0 \t\t\t %.9f \t\t %.9f\n', m0, n0);

% Loop
while (i <= N) 
    F = [f1(x(1), x(2)); f2(x(1), x(2))];
    J = [df1dx1(x(1), x(2)) df1dx2(x(1), x(2)); df2dx1(x(1), x(2)) df2dx2(x(1), x(2))];
    y = J\(-F);
    x = x + y;
    error = norm(y, inf);
    fprintf(' %d \t\t\t %.9f \t\t %.9f \t\t %f\n' ,i, x(1), x(2), error);
    
    if (norm(y) < tol) % Stopping Criteria
        fprintf('\nTotal number of iteration is: %d\n', i);
        fprintf('Solution after using Newton method is: (%.9f, %.9f)\n' , x(1), x(2));
        break;
    end
    i = i + 1;
end