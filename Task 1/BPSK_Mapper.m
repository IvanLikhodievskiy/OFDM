function signal = BPSK_Mapper(bitstream)
    
    % Map all points on IQ plane to a combination of bits using BPSK rule
    N = length(bitstream);
    signal = zeros(1, N);
    for i = 1:N
        if bitstream(i) == 0
            signal(i) = -1;
        else
            signal(i) = 1;
        end
    end
end
