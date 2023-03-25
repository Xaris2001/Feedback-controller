# Feedback-controller
Given a plant model 𝑦 = 𝐺(𝑠)𝑢 + 𝐺𝑑(𝑠)𝑑 with:
G(s) = 0.55/(0.005𝑠^2+0.06𝑠+0.1002) , Gd= 0.2/(0.005𝑠^2+0.06𝑠+0.1002) 
Design a feedback controller, using loop-shaping ideas, that satisfies the following objectives:
a. Tracking: rise time < 1s, overshoot < 5%
b. Rejection of unit step disturbance: |y|<0.1 at all times, |y| < 0.01 after 5s.
c. Input constraints: |u| < 2 at all times.
Plot the resulting sensitivity, complementary sensitivity, disturbance sensitivity and loop-gain
as functions of frequency and verify the performance through simulations in the time domain.
Also, compute the H∞-norm of the closed-loop transfer-function from disturbance to output.
Hint: scale the problem and determine the approximate requirements on the closed loop
