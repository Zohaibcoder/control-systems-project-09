clc , clear all ; close all 

%% Mass Spring Damper System 
m = 1 ; b = 1 ; k = 1;

%  -------------------------------- State Space Model ----------------------
A = [0 1;-k/m -b/m]; % System Matrix
B = [0 ; 1]; % Input Matrix
C = [1 0]; % Output Matrix
D = [0]; % Feedback Matrix

%% --------------------------- Visualizing the States one-by-one --------------------

% There are two states:
%1. Position(x1)
%2. Velocity(x2/x1dot)

C_position = [1 0]; % Output is only x1(Position)
sys_position = ss(A,B,C_position,D);

C_velocity = [0 1]; % Output is only x2(Velocity)
sys_velocity = ss(A,B,C_velocity,D);


figure

step(sys_position,'r')
hold on
step(sys_velocity,'b--')

grid on
legend('Position x_1','Velocity x_2','Location','best')
title('State Responses')