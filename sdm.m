% Steepest Descent Method

% Input
F = @(x1,x2) [x1^2 + x2 - 11; x1 + x2^2 - 7];
f1 = @(x1,x2) x1^2 + x2 - 11;
f2 = @(x1,x2) x1 + x2^2 - 7;
J = @(x1,x2)[2*(x1),1;1,2*(x2)];
g = @(x) (f1(x(1),x(2)))^2 + (f2(x(1),x(2)))^2;
grad_g = @(x) 2*transpose(J(x(1),x(2)))*F(x(1),x(2));

x0 = [-0.164;1];
tol = 1*10^(-7);
N = 1000;
i = 1;

fprintf('Iteration \t\t\t x1 \t\t\t x2 \t\t\t error\n');

% Loop
while(i <= N)
    d = -grad_g(x0);
    alpha = 1;
    s = 0.95;
    t = 0.45;
    while(g(x0+alpha*d) > g(x0) - alpha*t*norm(grad_g(x0))^2)
        alpha = s*alpha;
    end
    alpha0 = alpha;
    x = x0 + alpha0*d;
    error = max(abs(x-x0));
    fprintf(' %d \t\t\t %.9f \t\t %.9f \t\t %.9f\n',i,x(1),x(2),error);
    if(error < tol) %Stopping criteria
        fprintf('\nTotal number of iteration is: %d\n', i);
        fprintf('Solution after using Steepest Descent method is: (%.9f, %.9f)\n',x(1),x(2));
        break;
    end
    i = i + 1;
    x0 = x;
end