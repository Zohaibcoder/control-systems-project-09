clc , clear all ; close all 

%% Mass Spring Damper System 
m = 1 ; b = 1 ; k = 1;

%  -------------------------------- State Space Model ----------------------
A = [0 1;-k/m -b/m]; % System Matrix
B = [0 ; 1]; % Input Matrix
C = [1 0]; % Output Matrix
D = [0]; % Feedback Matrix

%% ----------------------------- Controllability ----------------------
% To see wether the input (force) affects both the states of system or not?
% if Rank(ControlledMatrix) = number of states


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