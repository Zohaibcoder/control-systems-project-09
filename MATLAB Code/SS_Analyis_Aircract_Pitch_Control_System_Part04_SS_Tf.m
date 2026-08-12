% system of state-space 
A = [0 1 0 ;0 0 1 ;-0.179 -0.987 -1.935];     % System Matrix
B = [0;0;1];                                  % Input Matrix
C = [1.282 -1.282 0];                         % Output Matrix
D = 0;                                        % Feedback through Matrix


sys_ss = ss(A,B,C,D)


sys_tf = tf(sys_ss)

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
