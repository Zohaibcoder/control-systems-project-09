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


%% --------------------------- Visualizing the States one-by-one --------------------

% There are two states:
%1. Position(x1)
%2. Velocity(x2/x1dot)

m = 1 ; b = 1 ; k = 1;
A = [0 1;-k/m -b/m];
B = [0 ; 1]; 
D = [0];

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


%% ----------------------------- Parameter Study ---------------

% Project 01 : m,b,k  ---> G(s) ---> poles ---> Response

% Project 09 : m,b,k  ---> A ---> eigen values ---> State Evaluation

B = [0 ; 1]; % Input Matrix
C = [1 0]; % Output Matrix
D = 0; % Feedback Matrix

                               %% Effect of mass 

mVal = [1,2,5,10];
k = 1 ; b = 1; 

figure
hold on ; grid on

for i = 1:length(mVal)
    m = mVal(i);
    A = [0 1;-k/m -b/m]; % System Matrix
    fprintf('eigen values of A when m = %d:\n',m)
    eigenValues = eig(A);
    disp(eigenValues)
    plot(real(eigenValues), imag(eigenValues), 'x', ...
        'MarkerSize', 10, 'LineWidth', 2)
    
end

xlabel('Real Axis')
ylabel('Imaginary Axis')
legend('m = 1','m = 2','m = 5','m = 10')
title('Eigenvalue Movement with Increasing Mass')

                              %% Effect of damper 

bVal = [1,2,5,10];
k = 1 ; m = 1; 

figure
hold on ; grid on

for i = 1:length(bVal)
    b = bVal(i);
    A = [0 1;-k/m -b/m]; % System Matrix
    fprintf('eigen values of A when b = %d:\n',b)
    eigenValues = eig(A);
    disp(eigenValues)
    plot(real(eigenValues), imag(eigenValues), 'x', ...
        'MarkerSize', 10, 'LineWidth', 2)
    
end

xlabel('Real Axis')
ylabel('Imaginary Axis')
legend('b = 1','b = 2','b = 5','b = 10')
title('Eigenvalue Movement with Increasing Damping')
                            %% Effect of friction

kVal = [1,2,5,10];
b = 1 ; m = 1;

figure
hold on ; grid on

for i = 1:length(kVal)
    k = kVal(i);
    A = [0 1;-k/m -b/m]; % System Matrix
    fprintf('eigen values of A when k = %d:\n',k)
    eigenValues = eig(A);
    disp(eigenValues)
    plot(real(eigenValues), imag(eigenValues), 'x', ...
        'MarkerSize', 10, 'LineWidth', 2)
    
end
xlabel('Real Axis')
ylabel('Imaginary Axis')
legend('k = 1','k = 2','k = 5','k = 10')
title('Eigenvalue Movement with Increasing Friction')



%% ----------------------------- Controllability ----------------------
% To see wether the input (force) affects both the states of system or not?
% if Rank(ControlledMatrix) = number of states

m = 1 ; b = 1 ; k = 1;

A = [0 1;-k/m -b/m]
B = [0 ; 1]
n = 2

Co = ctrb(A,B)
Rank = rank(Co)

if Rank == n 
    disp('The system is complelety controllable')
else
    disp('The system is not controllable')
end

% Test Case : Uncontrollable System

A_test = [0 1;-k/m -b/m]
B_test = [0 ; 0] % No input is applied

Co_test = ctrb(A_test,B_test)
Rank_test = rank(Co_test)

if Rank_test == n 
    disp('The system is complelety controllable')
else
    disp('The system is not controllable')
end


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

%% ----------------------------- Controllability ----------------------

A = [0 1 0 ;0 0 1 ;-0.179 -0.987 -1.935];     % System Matrix
B = [0;0;1];                                  % Input Matrix
C = [1.282 -1.282 0];                         % Output Matrix
D = 0;                                        % Feedback through Matrix


Co = ctrb(A,B);
disp('Controllable Matrix:')
disp(Co)

R = rank(Co);
disp('Rank:')
disp(R)



%% ----------------------------- Observability ----------------------

A = [0 1 0 ;0 0 1 ;-0.179 -0.987 -1.935];     % System Matrix
B = [0;0;1];                                  % Input Matrix
C = [1.282 -1.282 0];                         % Output Matrix
D = 0;                                        % Feedback through Matrix

Ob = obsv(A,C);
disp('Observability Matrix:')
disp(Ob)

R = rank(Ob);
disp('Rank:')
disp(R)


%% ------------------------------ SS & Tf ------------------


t = 0:0.01:30;

[y_tf,t_tf] = step(sys_tf,t);
[y_ss,t_ss] = step(sys_ss,t);

figure
plot(t_tf,y_tf,'LineWidth',1.5)
hold on
plot(t_ss,y_ss,'--','LineWidth',1.5)
grid on

xlabel('Time (s)')
ylabel('Pitch Angle')
title('Aircraft Pitch Response: Transfer Function vs State-Space')
legend('Transfer Function','State-Space')


