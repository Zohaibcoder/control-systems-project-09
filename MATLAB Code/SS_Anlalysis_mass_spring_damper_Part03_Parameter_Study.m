clc , clear all ; close all 

%% Mass Spring Damper System 
m = 1 ; b = 1 ; k = 1;

%  -------------------------------- State Space Model ----------------------
A = [0 1;-k/m -b/m]; % System Matrix
B = [0 ; 1]; % Input Matrix
C = [1 0]; % Output Matrix
D = [0]; % Feedback Matrix

%% ----------------------------- Parameter Study ---------------

% Project 01 : m,b,k  ---> G(s) ---> poles ---> Response

% Project 09 : m,b,k  ---> A ---> eigen values ---> State Evaluation

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