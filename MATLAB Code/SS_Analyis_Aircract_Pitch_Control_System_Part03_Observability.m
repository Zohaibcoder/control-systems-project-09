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