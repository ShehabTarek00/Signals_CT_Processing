
[amp_1, Fs_1] = audioread("C:\Users\Ali Mohamed\Downloads\Project2\input1.wav");

[amp_2, Fs_2] = audioread("C:\Users\Ali Mohamed\Downloads\Project2\input2.wav");

load Hd_1.mat
load Hd_1_1.mat
load Hd_2.mat
load Band_Pass.mat
load Low_Pass.mat

% Ensure both signals have the same sampling rate
Fs = min(Fs_1, Fs_2);
amp_1 = resample(amp_1, Fs, Fs_1);
amp_2 = resample(amp_2, Fs, Fs_2);

% Perform amplitude modulation
carrier_frequency1 = 145000;  % Choose a suitable carrier frequency for signal 1
carrier_frequency2 = 100; % Choose a suitable carrier frequency for signal 2

t = 0:1/Fs:(length(amp_1)-1)/Fs;

%**********************Getting the filtered audio********************
amp_1_Limited_freq=filter(Hd_1_1,amp_1);        %filter the audio


% %**********************Getting the filtered audio********************
amp_2_Limited_freq=filter(Hd_2,amp_2);        %filter the audio


% Modulate signal 1
modulated_signal1 = amp_1_Limited_freq .* cos(2*pi*carrier_frequency1*t)';

N_1=length(modulated_signal1);   %get the amplitude length
modulated_signal1_Freq=fft(modulated_signal1,N_1);
%Single sided with frequency
figure();
F_1=(0:N_1-1)*Fs/N_1;     %calculate the frequency to plot it
subplot(3,1,1);       %divide it into half and choose the first half
plot(F_1,abs(modulated_signal1_Freq)/N_1);  %draw the orignal audio


% Modulate signal 2
modulated_signal2 = amp_2_Limited_freq .* cos(2*pi*carrier_frequency2*t)';


N_2=length(modulated_signal2);   %get the amplitude length
%Single sided with frequency
modulated_signal2_Limited_freq_Freq=fft(modulated_signal2,N_2);
subplot(3,1,2);       %divide it into half and choose the first half
plot(F_1,abs(modulated_signal2_Limited_freq_Freq)/N_2);  %draw the orignal audio



% Combine the modulated signals
transmitted_signal = modulated_signal1 + modulated_signal2;


N_3=length(transmitted_signal);   %get the amplitude length
transmitted_signal_Audio_Freq=fft(transmitted_signal,N_3);  
%*********************Plotting the original audio***********************
%Single sided with frequencyf
subplot(3,1,3);       %divide it into half and choose the first half
plot(F_1,abs(transmitted_signal_Audio_Freq)/N_3);  %draw the orignal audio



%***********************Demodulation steps******************************

% Demodulate the first signal
demodulated_signal1 = filter(Band_Pass, transmitted_signal);
demodulated_signal1 = demodulated_signal1 .* cos(2*pi*carrier_frequency1*t)';
demodulated_signal1_Freq=fft(demodulated_signal1,N_3);


% Demodulate the second signal
demodulated_signal2 = filter(Low_Pass, transmitted_signal);
demodulated_signal2 = demodulated_signal2 .* cos(2*pi*carrier_frequency2*t)';
demodulated_signal2_Freq=fft(demodulated_signal2,N_3);


% Plot the demodulated signals
figure;

subplot(3, 1, 1);
plot(F_1, abs(transmitted_signal_Audio_Freq)/N_3);
title('Transimitted Signal');

subplot(3, 1, 2);
plot(F_1, abs(demodulated_signal1_Freq)/N_3);
title('Demodulated Signal 1');

subplot(3, 1, 3);
plot(F_1, abs(demodulated_signal2_Freq)/N_3);
title('Demodulated Signal 2');


audiowrite("output1.wav",demodulated_signal1,Fs); %save the filtered file
audiowrite("output2.wav",demodulated_signal2,Fs); %save the filtered file

