clc; clear all; close all;
G = tf([0.55], [0.005 0.06 0.1002]);
Gd = tf([0.2], [0.005 0.06 0.1002]);
plant = G + Gd;


wc = 0.22; % rad/s
PM = 45; % degrees(1 + 0.1s)/(1 + 10s)

% Design the controller using loop-shaping
s = tf('s');
Kr=(1 + 1.59*s)/(1 + 0.016*s) ; % lead-lag 
Kp = 0.0038; 
Ti = 0.044; % integral time constant
C_pi = Kp*((s+Ti)/s);% PI controller
C = C_pi*Kr; 
L = G*plant; 
S = 1/(1 + L); 
T = L/(1 + L); 
D = 1 - T; 
L_g = L*G; 

% Plot the sensitivity functions and loop gain
figure;
bode(S, T, D, L_g);
legend('Sensitivity', 'Complementary Sensitivity', 'Disturbance Sensitivity', 'Loop Gain');

% Simulate the closed-loop system in the time domain
sys_cl = feedback(L, 1);
t = 0:0.01:20;
r = 1*ones(size(t));
d = 0.1*ones(size(t));
[y, t] = lsim(sys_cl, r, t, d);
figure;
plot(t, y);
xlabel('Time (s)');
ylabel('Output y');
title('Time domain response');

% Ypologismos the H-infinity norm of the closed-loop transfer function from disturbance to output
sys_DtoY = feedback(G, C);
hinfnorm(sys_DtoY) % Anaparastash the H-infinity norm
