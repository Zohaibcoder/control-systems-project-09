%% ---------------------------- State Space Analyis of Aircract Pitch Control System ------------------------

% system of state-space 
A = [0 1 0 ;0 0 1 ;-0.179 -0.987 -1.935];     % System Matrix
B = [0;0;1];                                  % Input Matrix
C = [1.282 -1.282 0];                         % Output Matrix
D = 0;                                        % Feedback through Matrix


disp('-------------------- STATE SPACE RESPRESENTAION -------------------')
sys_ss = ss(A,B,C,D)

disp('-------------------- TRANSFER FUNCTION  RESPRESENTAION -------------------')
sys_tf = tf(sys_ss)


% Poles and Eigen Values

poles = pole(sys_ss);
disp('Poles of the system are:')
disp(poles)

eigenValues = eig(A);
disp('Eigen values of the system are:')
disp(eigenValues)