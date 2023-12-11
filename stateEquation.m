% suppose Wf, Ww, bf, bw are Gaussian noise,
% the derivative of bf and the derivative of bw are also Gaussian noise

% standard deviation,suppose 0.1
sigma_Wf = 0.1; 
sigma_Wb = 0.1; 
sigma_bf_dot = 0.1; 
sigma_bw_dot = 0.1; 

% generate the noises, (mean 0, standard deviation 1)
Wf = sigma_Wf * randn();
Wb = sigma_Wb * randn();
bf_dot = sigma_bf_dot * randn();
bw_dot = sigma_bw_dot * randn(); 

% initialize bf and bw =0
bf = 0;  
bw = 0
bf = bf + bf_dot * Delta_t;
bw = bw + bw_dot * Delta_t;


% input 
u = [a; omega];
% define state vector
x = [rho; nu; f; bf; bw; theta];
% define the matrix 
matrix_a = [0 Delta_t 0 0 0 0;
            0 0 Delta_t 0 0 0;
            0 0 0 0 0 0;
            0 0 0 0 0 0;
            0 0 0 0 0 0;
            0 0 0 0 0 0];
        
matrix_b = [0 0;
            0 0;
            c 0;
            0 0;
            0 0;
            0 1];

matrix_c = [0; 
            0; 
            -c*g; 
            Wf; 
            Wb; 
            0];

matrix_d = [1; 0; 0; 0; 0; 0];

% state equation
x_dot = matrix_a * x + matrix_b * u + matrix_c * Delta_t;


% observation equation
y = matrix_d * x +0 * u

