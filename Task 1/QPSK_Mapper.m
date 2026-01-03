function signal = QPSK_Mapper(bit_stream)
    % Calculate normalization coefficient for QPSK
    n = sqrt(sum([2 2 2 2]) / 4);
    
    % Map all points on IQ plane to a combination of bits using QPSK rule
    N = length(bit_stream);
    signal = zeros(1, N/2);
    for i = 1:2:N
        if bit_stream(i) == 0 && bit_stream(i+1) == 0
            signal((i+1)/2) = (-1 + 1j) / n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 1
            signal((i+1)/2) = (-1 - 1j) / n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 0
            signal((i+1)/2) = (1 + 1j) / n;
        else
            signal((i+1)/2) = (1 - 1j) / n;
        end
    end
end
