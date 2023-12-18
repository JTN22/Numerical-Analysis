% Newton for nonlinear

clear all, clc

% Given function
f1 = @(x1,x2,x3) 3*(x1)-cos((x2)*(x3)) - 1/2;
f2 = @(x1,x2,x3) (x1)^2 - 625*(x2)^2 - 1/4;
f3 = @(x1,x2,x3) exp(-(x1)*(x2)) + 20*(x3) + ((10*pi - 3)/3);

% Partial Derivative
df1dx1 = @(x1,x2,x3) 3;
df1dx2 = @(x1,x2,x3) (x3)*sin((x2)*(x3));
df1dx3 = @(x1,x2,x3) (x2)*sin((x2)*(x3));
df2dx1 = @(x1,x2,x3) 2*(x1);
df2dx2 = @(x1,x2,x3) -1250*(x2);
df2dx3 = @(x1,x2,x3) 0;
df3dx1 = @(x1,x2,x3) -(x2)*exp(-(x1)*(x2));
df3dx2 = @(x1,x2,x3) -(x1)^exp(-(x1)*(x2));
df3dx3 = @(x1,x2,x3) 20;

% Intial Condition
m0 = 1;
n0 = 1;
l0 = -1;

% Number of tolerance
tol = 10^-6;

% Maximum number of iterations
N0 = 1000;
n = 2;
x = [m0; n0;l0];
i = 1;
fprintf('Output: \n');

% Display the intial condition
fprintf('Approximation at iteration 0:  x1 = %.9f x2 = %.9f  x3 = %.9f\n', m0, n0,l0);
while (i <= N0) %Setting up loop
  F = [f1(x(1), x(2),x(3)); f2(x(1), x(2),x(3)); f3(x(1),x(2),x(3))];
  J = [df1dx1(x(1), x(2), x(3)) df1dx2(x(1), x(2), x(3)) df1dx3(x(1), x(2), x(3));
      df2dx1(x(1), x(2), x(3)) df2dx2(x(1), x(2), x(3)) df2dx3(x(1), x(2), x(3));
      df3dx1(x(1), x(2), x(3)) df3dx2(x(1), x(2), x(3)) df3dx3(x(1), x(2), x(3))];
  y = J\(-F);
  x = x + y;
   fprintf('Approximation at iteration %d: x1 = %.9f  x2 = %.9f  x3 = %.9f\n',i, x(1), x(2),x(3));
  if (norm(y) < tol) %Stopping Criteria
      fprintf('Total number of iteration is: %d\n', i);
      fprintf('Solution after using Newton method is: [%.9f; %.9f,%.9f]\n', x(1), x(2),x(3));
      break;
  end
  i = i + 1;
end
