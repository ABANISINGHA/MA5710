
%   Assignment 2 (Q-4)

% By taking the data of sigma and PSNR from the table of question 3 we are find the a linear regression polynomial by least square method 
sigma = 0.6:0.5:10.6;

PSNRValue = [16.36 12.92 12.37  12.17 12.07 12.01 11.97 11.94 11.92 11.90 11.88 11.86 11.85 11.83 11.82 11.81 11.79 11.78 11.77 11.76 11.75 ];

per = 0.8;
l = length(sigma);       % l = length of sigma
l1 = round(per * l);     % l1 = numbers in train sigma
l2 = l - l1;             % l2 = numbers in test sigma 

% By using randperm function we creat random permutation of indices
suffle = randperm(l);     % suffle = suffle the indices of sigma

% we divide suffled indices in two parts
t1 = suffle(1:l1);        % t1 = trained sigma indices
t2 = suffle(l1+1:end);    % t2 = test sigma indices

% we divede the data set of sigma in two data set

u = sigma(t1);     % u = train data of sigma
u1 = sigma(t2);     % u1 = test data of sigma
u
u1

v = PSNRValue(t1); % v = train data of PSNRValue
v1 = PSNRValue(t2); % v1 = test data of PSNRVale
v
v1

% we use least square regression method to find a line y=mx+c by fitting the trained data 

p = mean(u);  % p is mean of values of x
q = mean(v);  % q is mean of values of y

numerator = sum((u - p) .* (v - q));
denominator = sum((u - p) .^ 2);
m = numerator / denominator; % m = slope of line

c = q - m * p;  % c = intercept 

% The predicted linear function from the train data by least square method 

disp(['The function is y = ',num2str(m) ' x + ', num2str(c)]);

% so the line :y = mx + c
f = @(x)(m.*x+c);  

y_pred = f(u1);  % The predicted PSNR values from the test data of sigma

for i = 1: length(u1)
    disp(['The value of Predicted y for test data  ', num2str(u1(i)) ' is: ', num2str(y_pred(i))]);
end
for i = 1: length(u1);
    error(i) = abs(y_pred(i) - v1(i));
end
disp(['The absolute error for predicted PSNR and test PSNR is:']); 
error
% we calculate mean square error by using immse function
meanse = immse(v1, y_pred);
fprintf('Mean squared error: %.4f\n ', meanse);

