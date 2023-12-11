function d_euler = derivativeOfEuler(alpha, beta, gamma, omega_x, omega_y, omega_z)
    % input:Wx,Wy,Wz
    % output:alpha_dot,beta_dot,gamma_dot
    T = [1, 0, -sin(beta);
         0, cos(alpha), sin(alpha)*cos(beta);
         0, -sin(alpha), cos(alpha)*cos(beta)];

    
    R=inv(T);
    d_euler = R * [omega_x; omega_y; omega_z];
end