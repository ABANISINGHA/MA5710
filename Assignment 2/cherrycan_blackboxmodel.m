

% Assignment 2(Q-1)

% The experimental data set for obtaib the approximate curve.
% r is radius of cherry

r = [0.7,0.7,0.7,0.6,0.6,0.7,0.7,0.8,0.8,0.9,0.6,0.6,0.7,0.9,0.8,0.8,0.9,0.9,1,1,1,1,1,1,1];

%  radius of cylender R 
R = [2,2,3,2,3,3,3,3,4,4,3,3,4,3,3,3,2,3,2,2,3,3,3,3,4];

% h is height of the cylender
h = [3,4,4,4,3,3,5,10,10,10,5,4,10,10,5,3,4,5,4,3,3,4,5,10,10];

% N is the number of cherries

N = [17,23,52,40,63,40,70,90,160,115,105,85,240,60,40,22,10,30,6,4,11,16,22,42,80];

% creat test and train data for r
per = 0.8;
l = length(r);  % l = length of r
              
l1 = round(per * l);     % l1 = numbers in train r
l2 = l - l1;             % l2 = numbers in test  r 

% By using randperm function we creat random permutation of indices
suffle = randperm(l);     % suffle = suffle the indices of sigma

% we divide suffled indices in two parts
t1 = suffle(1:l1);        % t1 = trained r indices
t2 = suffle(l1+1:end);    % t2 = test r indices

% we divede the data set of r in two data set
x = r(t1); % x = train data of r
x1 = r(t2); % x1 = test data of r

% we use the indices of r as r,R,h have same number of indices
% creat test and train data for R
y = R(t1); % x = train data of R
y1 = R(t2); % x1 = test data of R

% creat test and train data for h
z = h(t1); % x = train data of h
z1 = h(t2); % x1 = test data of h

% creat test and train data for N
w = N(t1); % train data for N

w1 = N(t2); % test data for N

% here we use the Least square method to find the linear regression line
% for the predicted number of cherries

% we find the matrix A for solve the aystem Au = v.
A = [sum(x.^2) sum(x.*y) sum(x.*z); sum(x.*y) sum(y.^2) sum(y.*z); sum(x.*z) sum(y.*z) sum(z.^2) ];
v = [sum(x.*w); sum(y.*w); sum(z.*w)];
u = A\v;

k = mean(w) - u(1)*mean(x) -  u(2)*mean(x) - u(3)*mean(x);   % k is the intercept term
A,u,v,k

disp(['The function is y = (',num2str(k) ') + (',num2str(u(1)) ')x + (', num2str(u(2)) ')y+ (' , num2str(u(3)) ')z']);
g = @(q,s,t)(k+ u(1)*q + u(2)*s + u(3)*t);

Y = g(x1,y1,z1); % predicted values of number of cherries from the predicted line by the test values
Y
meanse = immse(w1, Y);
fprintf('Mean squared error: %.4f\n ', meanse);

for i=1: length(w1)
    error(i) = abs(Y(i) - w1(i));   
end
 % the absolute error
error








