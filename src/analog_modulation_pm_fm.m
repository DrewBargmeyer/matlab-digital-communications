%% Generating time values to plot on
mint = -2;
maxt = 2;
t = linspace(mint,maxt,8000);

%% Setting up baseband signal m(t)
A = 1;
T0 = 1;
mt = A*sawtooth(t*T0*2*pi);

%% Defining Phase Modulation Signal (PM)
AcPM = 1;
kp = 2;
fcPM = 1000;
PMst = AcPM*cos(2*pi*fcPM*t+kp*mt);

%% Defining Frequency Modulation Signal (FM)
AcFM = 1;
kf = 2;
fcFM = 1000;
dt = t(2) - t(1);
FMst = AcFM*cos(2*pi*fcFM*t+2*pi*kf*cumsum(mt)*dt);

%% Plotting signals

%% Plotting baseband signal m(t)
plot(t,mt)
title('Baseband Signal m(t)')
xlabel('Time')
ylabel('Magnitude')
figure

%% Plotting Phase Modulation Signal (PM)
plot(t,PMst)
xlim([-2,2])
title('Phase Modulation Signal (PM)')
xlabel('Time')
ylabel('Magnitude')
figure

%% Plotting Frequency Modulation Signal (FM)
plot(t,FMst)
xlim([-2,2])
title('Frequency Modulation Signal (FM)')
xlabel('Time')
ylabel('Magnitude')
