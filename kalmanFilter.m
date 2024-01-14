function [x,P] = kalmanFilter(x,u,z,A,B,H,P,Q,R)
    % x : the state to be estimated
    % u : the input vector to the state equation
    % z : the mathematically modelled y
     
    % A and B Matrix £ºthe matrix for our mathematical modelling.
    % H : the mathematically modelled C matrix, which is the observation matrix
    % K : the Kalman gain
    % P : the estimated covariance
    % Q : the process noise covariance, it means the noise inside x    
    % R : measurement noise, measurement noise covariance
    
    x = A * x + B * u;
    P = A * P * A'+ Q;
    
    K = P * H'/(H * P * H' + R);
    x = x + K * (z - H * x);
    P = (eye(length(x)) - K * H) * P;
end