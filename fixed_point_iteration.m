%% Fixed-Point Iteration
% Based off of Section 2.2 Fixed-Point Iteration of Burden and Faires
%% About this code
% This code approximates a solution to p = g(p) given an initial
% approximation p0.
% INTPUTS:
%   p0          = initial approximation
%   tol         = tolerance
%   max_iter    = maximum number of iterations
% OUTPUTS:
%   p           =  approximate solution
%   or error message
%% Information and set up
% g = @(x) (3*x.^4 + 2*x.^2 + 3)/(4*x.^3 + 4*x - 1);
g = @(x) (3*x.^4 + 2*x.^2 + 3)/(4*x.^3 + 4*x - 1);                % the function whose fixed-point we want to approximate 
p0 = 1;
tol = 1e-10;                 % tolerance, 1e-4 = 10^{-4}
max_iter = 4;              % max number of iterations
%% Fixed-Point Iteration 
fprintf('i\tp_i\t|p_i - p_{i-1}|\n');          % for display
for i = 0:max_iter
    % get p_i 
    p = g(p0);              % p_i 
    
    % display information
    fprintf('%d\t%.9f\t%.11f\n',i,p, abs(p - p0));    % displays iteration i, p_i
    
    % check stopping condition 
    if(abs(p - p0) < tol) % |g(p) - p| < tol 
        break;
    end
    
    % prepare for next iteration
    p0 = p;
end
%% Display Information
if( i <= max_iter )         % successful
    fprintf('\nFixed-Point Iteration approximated the the fixed-point p = %.9f after %d iterations.\n\n',p,i);
else                        % not successful 
    fprintf('\nFixed-Point Iteration did not converge within the tolerance in %d iterations.\n\n',max_iter)
end
