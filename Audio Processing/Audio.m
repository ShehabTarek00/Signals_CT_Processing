%****************************************************************************
%********************************Working on the first audio*****************
%****************************************************************************

load Hd_1.mat
load Hd_1_1.mat

%**********************Reading the original audio********************
[amp, Fs] = audioread("C:\Users\Ali Mohamed\Downloads\Project2\input1.wav"); %get the file 
om=audioplayer(amp,Fs);   %make orignal audio object
N=length(amp);   %get the amplitude length
Original_Audio_Freq=fft(amp,N);   %frequency shift the filter
%*********************Plotting the original audio***********************
%Single sided with k
figure();       %opens a figure
k=0:N-1;        %calculating k
subplot(1,3,1); %divide it into half and choose the first half
plot(k,abs(Original_Audio_Freq));%draw the orignal audio
pause(3);       %wait 3 seconds
%Single sided with frequencyf
F_1=(0:N-1)*Fs/N;     %calculate the frequency to plot it
subplot(1,3,2);       %divide it into half and choose the first half
plot(F_1,abs(Original_Audio_Freq)/N);  %draw the orignal audio
%Double sided with frequency 
F_2=(-N/2:N/2-1)*Fs/N;         %center the frequency to plot it
subplot(1,3,3);                %divide it into half and choose
plot(F_2,abs(fftshift(fft(amp)))/N);%draw the orignal audio


% %**********************Limit the maximum frequency********************
Limited_Freq_Audio=filter(Hd_1,amp);        %Limit the frequency the audio
 
% %**********************Getting the filtered audio********************
filtered_audio=filter(Hd_1_1,Limited_Freq_Audio);        %filter the audio
fm=audioplayer(filtered_audio,Fs);   %make filter audio object
Filered_Audio_Freq=fft(filtered_audio,N);


% %*********************Plotting the Filtered audio***********************
% %Single sided with k
figure();
subplot(1,3,1); %second half
plot(k,abs(Filered_Audio_Freq));%draw the filter audio
%Single sided with frequency
subplot(1,3,2);     %second half
plot(F_1,abs(Filered_Audio_Freq)/N);  %draw the filter audio
pause(3);           %wait 3 seconds
%Double sided with frequency
subplot(1,3,3);             %second half
plot(F_2,abs(fftshift(fft(filtered_audio)))/N);%draw the filter audio
 
%audiowrite("output1_filtered.wav",filtered_audio,fs); %save the filtered file



%****************************************************************************
%********************************Working on the Second audio*****************
%****************************************************************************

load Hd_2.mat
%**********************Reading the original audio********************
[amp, Fs] = audioread("C:\Users\Ali Mohamed\Downloads\Project2\input2.wav"); %get the file 
om=audioplayer(amp,Fs);   %make orignal audio object
N=length(amp);   %get the amplitude length
Original_Audio_Freq=fft(amp,N);   %frequency shift the filter
%*********************Plotting the original audio***********************
%Single sided with k
figure();       %opens a figure
k=0:N-1;        %calculating k
subplot(1,3,1); %divide it into half and choose the first half
plot(k,abs(Original_Audio_Freq));%draw the orignal audio
pause(3);       %wait 3 seconds
%Single sided with frequencyf
F_1=(0:N-1)*Fs/N;     %calculate the frequency to plot it
subplot(1,3,2);       %divide it into half and choose the first half
plot(F_1,abs(Original_Audio_Freq)/N);  %draw the orignal audio
%Double sided with frequency 
F_2=(-N/2:N/2-1)*Fs/N;         %center the frequency to plot it
subplot(1,3,3);                %divide it into half and choose
plot(F_2,abs(fftshift(fft(amp)))/N);%draw the orignal audio


% %**********************Limit the maximum frequency********************
Limited_Freq_Audio=filter(Hd_1,amp);        %Limit the frequency the audio
 
% %**********************Getting the filtered audio********************
filtered_audio=filter(Hd_2,Limited_Freq_Audio);        %filter the audio
fm=audioplayer(filtered_audio,Fs);   %make filter audio object
Filered_Audio_Freq=fft(filtered_audio,N);


% %*********************Plotting the Filtered audio***********************
% %Single sided with k
figure();
subplot(1,3,1); %second half
plot(k,abs(Filered_Audio_Freq));%draw the filter audio
%Single sided with frequency
subplot(1,3,2);     %second half
plot(F_1,abs(Filered_Audio_Freq)/N);  %draw the filter audio
pause(3);           %wait 3 seconds
%Double sided with frequency
subplot(1,3,3);             %second half
plot(F_2,abs(fftshift(fft(filtered_audio)))/N);%draw the filter audio
 
%audiowrite("output2_filtered.wav",filtered_audio,fs); %save the filtered file
