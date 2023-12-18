% Gauss-Seidel

clear all,clc

% Using fixed point iteration to find root 
g1 = @(x1, x2) sqrt (1 - (x2)^2);
g2 = @(x1,x2) sqrt((9 - 5*(x1)^2)/21);

% Initial point
m0 = 0.5;
n0 = 0.3;

% Number of iteration
tol = 1*10^(-7);

% Maximum number of iteration
N0 = 1000;
fprintf('Output: \n' )

% Fixed point iteration
for i = 1:N0
    % get pi
    m = g1(m0, n0) ;
    n = g2(m, n0) ;
    error1 = abs (m - m0);
    error2 = abs(n - n0);
    fprintf (' i = %dm = %.5f n = %.5f error 1 = %.5f error 2 = %.5f\n',i,m,n,error1,error2)
    if (abs(m - m0) < tol && abs (n-n0) < tol) %Stopping cirteria
        break;
    end

    % Prepare for the next iteration
    m0 = m;
    n0 = n;
end

%Display information
%Testing convergence 
if(i < N0)
    fprintf('In Aproximation for fixed point m = %0.9f and n = %0.9f of Gauss Seidel Method after %d iterations',m,n,i);
else
    fprintf('In Gauss Seidel Method is divergence in %d iteration',N0)
end
