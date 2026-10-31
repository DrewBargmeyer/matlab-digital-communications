%% Establishing samples
maxf = 0.001;
minf = -0.001;
t = linspace(minf,maxf,400);

%% Generating sinusoid
A = 3.25;
f = 1000;
tau = pi/6;
Sinusoid = A*sin(2*pi*f*t+tau);

% Plotting the Analog Sinusoid Signal
plot(t, Sinusoid)
xlim([-0.0006 0.0006])
ylim([-3.4 3.4])
title("Analog Sinusoid Plot")
xlabel("Time in seconds")
ylabel("Magnitude")

%% Sampling the signal
% Getting Sampling Period
Nyquist = 2*f;
FourNyquist = 4 * Nyquist;
fs = FourNyquist;
Ts = 1/fs;
% Creating Samples
samples = minf:Ts:maxf;
%% Sampled signal
SampledSignal = A*sin(2*pi*f*samples + tau);

% Plotting Sampled Signal
figure
stem(samples, SampledSignal, 'filled')
xlim([-0.0006 0.0006])
ylim([-3.4 3.4])
title("Sampled Sinusoid Plot")
xlabel("Time in seconds")
ylabel("Magnitude")

%% Uniform Quantizer
d = zeros(size(SampledSignal));

for i = 1:length(SampledSignal)
    
    if SampledSignal(i) < -2.5
        d(i) = -3;
    elseif -2.5 <= SampledSignal(i) & SampledSignal(i) < -1.5
        d(i) = -2;
    elseif -1.5 <= SampledSignal(i) & SampledSignal(i) < -0.5
        d(i) = -1;
    elseif -0.5 <= SampledSignal(i) & SampledSignal(i) < 0.5
        d(i) = 0;
    elseif 0.5 <= SampledSignal(i) & SampledSignal(i) < 1.5
        d(i) = 1;
    elseif 1.5 <= SampledSignal(i) & SampledSignal(i) < 2.5
        d(i) = 2;
    elseif 2.5 <= SampledSignal(i) 
        d(i) = 3;
    end
end

% Plotting Quantized Signal
figure
stem(samples, d, 'filled')
xlim([-0.0006 0.0006])
ylim([-3.4 3.4])
title("Uniform Quantized Sinusoid Plot")
xlabel("Time in seconds")
ylabel("Magnitude")

%% Midrise Quantizer
r = zeros(size(SampledSignal));

for i = 1:length(SampledSignal)
    
    if SampledSignal(i) < -3
        r(i) = -3.5;
    elseif -3 <= SampledSignal(i) & SampledSignal(i) < -2
        r(i) = -2.5;
    elseif -2 <= SampledSignal(i) & SampledSignal(i) < -1
        r(i) = -1.5;
    elseif -1 <= SampledSignal(i) & SampledSignal(i) < 0
        r(i) = -0.5;
    elseif 0 <= SampledSignal(i) & SampledSignal(i) < 1
        r(i) = 0.5;
    elseif 1 <= SampledSignal(i) & SampledSignal(i) < 2
        r(i) = 1.5;
    elseif 2 <= SampledSignal(i) & SampledSignal(i) < 3
        r(i) = 2.5;
    elseif 2.5 <= SampledSignal(i) 
        r(i) = 3;
    end
end

% Plotting Quantized Signal
figure
stem(samples, r, 'filled')
xlim([-0.0006 0.0006])
ylim([-3.6 3.4])
title("Midrise Quantized Sinusoid Plot")
xlabel("Time in seconds")
ylabel("Magnitude")
