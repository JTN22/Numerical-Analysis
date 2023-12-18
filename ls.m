%Linear shooting method

%Using Midpoint Method to solve the resulting IVPs
clear all
clc

% initialization
a=0; %Set as left endpoint
b=2; %Set as right endpoint
h=0.2; %Set h to calculate number of steps
alpha=0;
beta=-4;
yexact=@(x) (1/6)*(x.^3)*exp(x) - (5/3)*x*exp(x) + 2*exp(x) - x - 2;

xx=a:h:b;
N=length(xx);

%preparation for Midpoint Method
f1=@(x,y,z) z; %y=y1, z=y2=y'
f2=@(x,y,z) 2*z - y + x*exp(x) - x;

% first IVP
w1(1)=alpha;
w2(1)=0;
for i=1:(N-1)
    w1_mid = w1(i) + (h/2)*w2(i);
    w2_mid = w2(i) + (h/2)*f2(xx(i), w1(i), w2(i));
    
    w1(i+1) = w1(i) + h*w2_mid;
    w2(i+1) = w2(i) + h*f2(xx(i)+h/2, w1_mid, w2_mid);
end

% second IVP
v1(1)=alpha;
v2(1)=1;
for i=1:(N-1)
    v1_mid = v1(i) + (h/2)*v2(i);
    v2_mid = v2(i) + (h/2)*f2(xx(i), v1(i), v2(i));
    
    v1(i+1) = v1(i) + h*v2_mid;
    v2(i+1) = v2(i) + h*f2(xx(i)+h/2, v1_mid, v2_mid);
end

% computation of lambda
lambda = (beta-v1(N))/(w1(N)-v1(N));

% final numerical solution
w(1:N) = lambda*w1(1:N)+(1-lambda)*v1(1:N);

%Plot the data
subplot(3,1,1)
pause(3)
plot(xx,w1,'r')
hold on
pause(5)
plot(xx,v1,'b')
hold on
lambda
pause(5)
plot(xx,w,'g')
legend('Numerical solution of problem 1', 'Numerical solution of problem 2','Numerical solution')
for i=1:N
    yex(i)=yexact(xx(i));
    err(i)=abs(w(i)-yex(i));
end
pause(5)
subplot(3,1,2)
plot(xx,w, '*')
hold on
pause(5)
plot(xx,yex)
legend('Numerical solution', 'exact solution')
subplot(3, 1, 3)
pause(5)
plot(xx,err)
legend('Abs error')