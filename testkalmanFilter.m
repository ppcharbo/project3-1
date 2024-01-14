% Testing kalmanFilter.m code
% Suppose a point has: velocity, position, constant acceleration.
% x = [position; velocity].
% [x,P] = kalmanFilter(x,u,z,A,B,H,P,Q,R)
delta_t= 0.1;
A = [1, delta_t; 0, 1] ;
B = [1/2*delta_t;delta_t];
H = [1,0];
Q = [0.1, 0; 0, 0.1];
R = 1;
P = [1,0;0,1]; 
time = 0:0.1:10;
% Assume that the initial position of the point is 0, 
% the velocity is 0, and the acceleration is u = a = 1m/s ^2
x = [0;0];
a = 1;
u = a;
% Assuming ground truth
gt = [1/2 * a * time.^2; a * time];


% Ground truth is the test value for opencv.
% measurements are ground truth + noise
% z = kth measurement
result = zeros(2, 101);
measurement =  gt(1, :) + R * randn(size(time));

for k = 1:length(time)
    z = measurement(k);
    [x,P] = kalmanFilter(x,u,z,A,B,H,P,Q,R);
    result(:, k) = x;
end    


% Plotting Ground Truth and Estimated Position
% Only position is considered, not velocity.
plot(time, gt(1, :), 'r--', 'LineWidth', 2); 
hold on;
plot(time, result(1, :), 'g-', 'LineWidth', 2); 
hold off;
title('Comparison of Ground Truth and Estimated Position');
xlabel('Time');
ylabel('Position');
legend('Ground Truth', 'Estimated Position');

% Calculate the difference, 
% the smaller the value of mse means the higher the accuracy of our model
difference = (gt - result).^2;
mse = mean(difference, 2);
