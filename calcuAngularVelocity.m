function W = calcuAngularVelocity(alpha, beta, gamma, alpha_dot, beta_dot, gamma_dot)
    % input:alpha_dot,beta_dot,gamma_dot
    % output:Wx,Wy,Wz
    T = [1, 0, -sin(beta);
         0, cos(alpha), sin(alpha)*cos(beta);
         0, -sin(alpha), cos(alpha)*cos(beta)];

    
    W = T * [alpha_dot; beta_dot; gamma_dot];
end


