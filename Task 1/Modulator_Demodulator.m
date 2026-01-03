%% Clean variables and command line before start
close; clear; clc;

%% Read a text file and convert it to binary
fid = fopen('Romeo and Juliet.txt', 'r');
text = fread(fid);
fclose(fid);

binary_text = dec2bin(text);
binary_text = reshape(binary_text.', 1, numel(binary_text));

bitstream = zeros(1, numel(binary_text));

for i = 1:numel(bitstream)
    bitstream(i) = str2num(binary_text(i));
end

%% Modulator

% Map bits to the complex plane
signal = QAM16_Mapper(bitstream);

% Set up parameters
Nc = 400;
Nfft = 1024;

gap = Nc - mod(numel(signal), Nc);
signal = [signal zeros(1, gap)];
signal = reshape(signal, Nc, []).';

modulated_symbols = zeros(size(signal, 1), Nfft);
for i = 1:size(modulated_symbols, 1)
    modulated_symbols(i, :) = ifft(signal(i, :), Nfft);
end

%% Transmitter - Reciever
TR = reshape(modulated_symbols.', 1, numel(modulated_symbols));

%% Demodulator

demodulated_symbols = zeros(numel(TR) / Nfft, Nc);
for i = 1:size(demodulated_symbols, 1)
    demodulated_symbol = fft(TR((i-1)*Nfft+1: i*Nfft), Nfft);
    demodulated_symbol(Nc+1:end) = []; 
    demodulated_symbols(i, :) = demodulated_symbol;
end

%% Write the result to a file

signal = reshape(demodulated_symbols.', 1, numel(demodulated_symbols));
signal(end-gap+1:end) = [];

bitstream = QAM16_Demapper(signal);

fid = fopen('Test.txt', 'w');
for i = 1:7:length(bitstream)
    letter = bin2dec(strrep(num2str(bitstream(i:i+6)), ' ', ''));
    fwrite(fid, letter);
end
fclose(fid);

%% Calculate BER
fid_orig = fopen('Romeo and Juliet.txt', 'r');
text_orig = fread(fid_orig);
fclose(fid_orig);

fid_new = fopen('Test.txt', 'r');
text_new = fread(fid_new);
fclose(fid_new);

fprintf('BER: %d\n', biterr(text_orig, text_new))