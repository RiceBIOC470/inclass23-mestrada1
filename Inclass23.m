%GB comments
1. 70 incorrect plots with no labels. Should be generated like this:
sol = ode23(@repressilator,[0 200], [1, 0,0]);
hold on
plot(sol.x, sol.y(1,:));
plot(sol.x, sol.y(2,:));
plot(sol.x, sol.y(3,:));
hold off 
legend('x1','x2','x3')

2. 90 Same, incorrect plots. General discussion is ok
3. 90 This questions requires you to scan through multiple parameters of k2 to capture and understand the behavior of the system. Values of k2<1 leads to dampened oscillations. Values below 0.15 remove osclliations. Values above 1 generate oscillations with a periodicity and amplitude directed by the magnitude of k2.  
4.100
overall 88



%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 

sol1 = ode23(@repressilator, [0 200], [1, 0, 0]);
plot(sol1.y(1,:), sol1.y(2,:), 'b-');
hold on;
plot(sol1.y(2,:), sol1.y(3,:), 'r-');
hold on;
plot(sol1.y(3,:), sol1.y(1,:), 'g-');
legend('Repressor1', 'Repressor2', 'Repressor3');

% This model does indeed oscillate.

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?

sol1 = ode23(@repressilator, [0 200], [0.5, 0.5, 0.5]);
plot(sol1.y(1,:), sol1.y(2,:), 'b-');
hold on;
plot(sol1.y(2,:), sol1.y(3,:), 'r-');
hold on;
plot(sol1.y(3,:), sol1.y(1,:), 'g-');
legend('Repressor1', 'Repressor2', 'Repressor3');

% In this case, we lose the oscillation pattern observed with the
% intitial conditions used in part 1. Additionally, the circuit solutions
% show a linear oscillation relationship; the repressors all start at the
% same value, so they will increase or decrease at the same rate allowing
% for no gene product variation (this eliminates circular oscillation). 

% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates. 

% Making k2 larger for all genes maintains the oscillation pattern, but
% shifts it closer to lower x values (increases repression). Making k2 
% smaller for all genes decreases the repression and creates more of a 
% spiral pattern. Furthermore, a k2 of 0 causes the oscillation pattern 
% to disappear. 

sol1 = ode23(@repressilator_k2large, [0 200], [1, 0, 0]);
plot(sol1.y(1,:), sol1.y(2,:), 'b-');
hold on;
plot(sol1.y(2,:), sol1.y(3,:), 'r-');
hold on;
plot(sol1.y(3,:), sol1.y(1,:), 'g-');
legend('Repressor1', 'Repressor2', 'Repressor3');

sol1 = ode23(@repressilator_k2small, [0 200], [1, 0, 0]);
plot(sol1.y(1,:), sol1.y(2,:), 'b-');
hold on;
plot(sol1.y(2,:), sol1.y(3,:), 'r-');
hold on;
plot(sol1.y(3,:), sol1.y(1,:), 'g-');
legend('Repressor1', 'Repressor2', 'Repressor3');

sol1 = ode23(@repressilator_k2_0, [0 200], [1, 0, 0]);
plot(sol1.y(1,:), sol1.y(2,:), 'b-');
hold on;
plot(sol1.y(2,:), sol1.y(3,:), 'r-');
hold on;
plot(sol1.y(3,:), sol1.y(1,:), 'g-');
legend('Repressor1', 'Repressor2', 'Repressor3');

% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 

% One gene with larger k2
sol1 = ode23(@repressilator_k2_1change, [0 200], [1, 0, 0]);
plot(sol1.y(1,:), sol1.y(2,:), 'b-');
hold on;
plot(sol1.y(2,:), sol1.y(3,:), 'r-');
hold on;
plot(sol1.y(3,:), sol1.y(1,:), 'g-');
legend('Repressor1', 'Repressor2', 'Repressor3');

% One gene with smaller k2
sol1 = ode23(@repressilator_k2_2change, [0 200], [1, 0, 0]);
plot(sol1.y(1,:), sol1.y(2,:), 'b-');
hold on;
plot(sol1.y(2,:), sol1.y(3,:), 'r-');
hold on;
plot(sol1.y(3,:), sol1.y(1,:), 'g-');
legend('Repressor1', 'Repressor2', 'Repressor3');

% Making k2 larger or smaller for only one of the genes, still allows for 
% oscillation, but the shapes of the different repressors are separated 
% from each other, rather than overlapping each other, due to varying dx's
% for the genes.
