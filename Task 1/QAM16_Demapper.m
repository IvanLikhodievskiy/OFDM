function bitstream = QAM16_Demapper(signal)
    % Calculate normalization coefficient for QAM16
    n = sqrt(sum([2 2 2 2 10 10 10 10 10 10 10 10 18 18 18 18]) / 16);
    bitstream = zeros(1, 4 * length(signal));

    % Map a bit combination to an IQ point using QAM16 rule
    for i = 1:length(signal)
        if real(signal(i)) < -2/n && imag(signal(i)) > 2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 0;
        elseif real(signal(i)) < -2/n && imag(signal(i)) > 0 && ...
                imag(signal(i)) < 2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 1;
        elseif real(signal(i)) < -2/n && imag(signal(i)) < -2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 0;
        elseif real(signal(i)) < -2/n && imag(signal(i)) < 0 && ...
                imag(signal(i)) > -2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 1;
        elseif real(signal(i)) < 0 && real(signal(i)) > -2/n && ...
                imag(signal(i)) > 2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 0;
        elseif real(signal(i)) < 0 && real(signal(i)) > -2/n && ...
                imag(signal(i)) > 0 && imag(signal(i)) < 2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 1;
        elseif real(signal(i)) < 0 && real(signal(i)) > -2/n && ...
                imag(signal(i)) < -2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 0;
        elseif real(signal(i)) < 0 && real(signal(i)) > -2/n && ...
                imag(signal(i)) < 0 && imag(signal(i)) > -2/n
            bitstream(4*i-3) = 0;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 1;
        elseif real(signal(i)) > 2/n && imag(signal(i)) > 2/n
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 0;
        elseif real(signal(i)) > 2/n && imag(signal(i)) > 0 && ...
                imag(signal(i)) < 2/n
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 1;
        elseif real(signal(i)) > 2/n && imag(signal(i)) < -2/n
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 0;
        elseif real(signal(i)) > 2/n && imag(signal(i)) < 0 && ...
                imag(signal(i)) > -2/n
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 0;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 1;
        elseif real(signal(i)) > 0 && real(signal(i)) < 2/n && ...
                imag(signal(i)) > 2/n
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 0;
        elseif real(signal(i)) > 0 && real(signal(i)) < 2/n && ...
                imag(signal(i)) > 0 && imag(signal(i)) < 2/n
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 0;
            bitstream(4*i) = 1;
        elseif real(signal(i)) > 0 && real(signal(i)) < 2/n && ...
                imag(signal(i)) < -2/n
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 0;    
        else
            bitstream(4*i-3) = 1;
            bitstream(4*i-2) = 1;
            bitstream(4*i-1) = 1;
            bitstream(4*i) = 1;
        end
    end
end