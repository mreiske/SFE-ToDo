% user inputs parameters
disp('Please input lag value lag, value of beta1 beta as: [30, 0.5]') ;
disp(' ') ;
para=input('[lag, beta]=');

while length(para) < 2
    disp('Not enough input arguments. Please input in 1*2 vector form like [30, 0.5] or [30 0.5]');
    para = input('[lag, beta]=');
end

lag  = para(1);
beta = para(2);

% main computation
randn('state', 0)              % Start from a known state.
x = randn(10000, 1);           % 10000 Gaussian deviates ~ N(0, 1).
y = filter([1 beta], 1, x);    % Create an MA(1) process.
autocorr(y, lag, [], 2);       % Plot