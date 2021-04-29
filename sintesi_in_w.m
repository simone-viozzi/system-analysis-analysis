
clear variables;
close all;

s = tf('s');

num = 4*(1+s/1.42);

den = s*(1+s/10)^2*(1+s/14.2);

sys = num/den;

figure
asymp(sys)
grid


figure
bode(sys)
grid

P = nicholsoptions; 
P.PhaseUnits = 'deg';
P.Grid = 'on';
P.XLim = {[-180, -60]};
P.YLim = {[-20, 40]};

figure
nichols(sys, P)
ngrid

sys_chiusa = feedback(sys, 1);

fb = bandwidth(sys_chiusa);
Mr = 20*log10(getPeakGain(sys_chiusa));
B3_Hz = fb/(2*pi);

m = allmargin(sys);

m.PhaseMargin;
m.PMFrequency;
m.Stable;



fprintf('m_phi: %f\n', m.PhaseMargin)
fprintf('Wt: %f\n', m.PMFrequency)
fprintf('Stable: %d\n', m.Stable)
fprintf('B3_Hz: %f\n', B3_Hz)
fprintf('Mr: %f\n', Mr)


%rlocus(sys)