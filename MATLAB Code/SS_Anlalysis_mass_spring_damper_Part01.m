clc , clear all ; close all 

%% Mass Spring Damper System 
m = 1 ; b = 1 ; k = 1;

%  -------------------------------- State Space Model ----------------------
A = [0 1;-k/m -b/m]; % System Matrix
B = [0 ; 1]; % Input Matrix
C = [1 0]; % Output Matrix
D = [0]; % Feedback Matrix


sys_ss = ss(A,B,C,D)
poles = pole(sys_ss)
eigenValues = eig(A)

%  ------------------------------ Transfer Function ----------------------
% sys_tf = tf(sys_ss)
num = 1 ; 
den = [m b k];
sys_tf = tf(num,den)

%  ------------------------------ Verification ----------------------
figure(1)
step(sys_ss,'r') ; hold on 
step(sys_tf,'b--') ; 
grid on 
legend('State Space', 'Transfer Function');
title('Verification: Step Response Comparison');



figure(2)
impulse(sys_ss,'r') ; hold on 
impulse(sys_tf,'b--') ; 
grid on 
legend('State Space', 'Transfer Function');
title('Verification: Impulse Response Comparison');