function signal = QAM16_Mapper(bit_stream)
    % Calculate normalization coefficient for QAM16
    n = sqrt(sum([2 2 2 2 10 10 10 10 10 10 10 10 18 18 18 18]) / 16);

    % Map a point on IQ plane to a combination of bits using QAM16 rule
    N = length(bit_stream);
    signal = zeros(1, floor(N/4));
    for i = 1:4:(N-mod(N, 4))
        if bit_stream(i) == 0 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 0
            signal((i+3)/4) = (-3 + 3j)/n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 1
            signal((i+3)/4) = (-3 + 1j)/n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 1 && bit_stream(i+3) == 0
            signal((i+3)/4) = (-3 - 3j)/n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 1 && bit_stream(i+3) == 1
            signal((i+3)/4) = (-3 - 1j)/n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 1 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 0
            signal((i+3)/4) = (-1 + 3j)/n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 1 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 1
            signal((i+3)/4) = (-1 + 1j)/n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 1 && ...
                bit_stream(i+2) == 1 && bit_stream(i+3) == 0
            signal((i+3)/4) = (-1 - 3j)/n;
        elseif bit_stream(i) == 0 && bit_stream(i+1) == 1 && ...
                bit_stream(i+2) == 1 && bit_stream(i+3) == 1
            signal((i+3)/4) = (-1 - 1j)/n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 0
            signal((i+3)/4) = (3 + 3j)/n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 1
            signal((i+3)/4) = (3 + 1j)/n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 1 && bit_stream(i+3) == 0
            signal((i+3)/4) = (3 - 3j)/n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 0 && ...
                bit_stream(i+2) == 1 && bit_stream(i+3) == 1
            signal((i+3)/4) = (3 - 1j)/n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 1 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 0
            signal((i+3)/4) = (1 + 3j)/n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 1 && ...
                bit_stream(i+2) == 0 && bit_stream(i+3) == 1
            signal((i+3)/4) = (1 + 1j)/n;
        elseif bit_stream(i) == 1 && bit_stream(i+1) == 1 && ...
                bit_stream(i+2) == 1 && bit_stream(i+3) == 0
            signal((i+3)/4) = (1 - 3j)/n;
        else
            signal((i+3)/4) = (1 - 1j)/n;
        end
    end
end
