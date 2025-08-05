
fs=44100; %sampling frequency ,it is commonly used with audio
bit_depth=16; %most common with audio
record_length =10; %record length in seconds
channel =2; %choosing number of channels (stereo mode)
recorder=audiorecorder(fs,bit_depth,channel);
disp('Start speaking..')
%Record audio
recordblocking(recorder,record_length);
disp('End of Recording.');
audio_data=getaudiodata(recorder,'uint8');%recorded audio data
audiowrite('input1.wav',audio_data,fs);%audio file