function bitstream = QPSK_Demapper(signal)
    % Map a bit combination to an IQ point using QPSK rule
    bitstream = zeros(1, 2 * length(signal));
    
    for i = 1:length(signal)
        if real(signal(i)) < 0 && imag(signal(i)) > 0
            bitstream(2*i-1) = 0;
            bitstream(2*i) = 0;
        elseif real(signal(i)) < 0 && imag(signal(i)) < 0
            bitstream(2*i-1) = 0;
            bitstream(2*i) = 1;
        elseif real(signal(i)) > 0 && imag(signal(i)) > 0
            bitstream(2*i-1) = 1;
            bitstream(2*i) = 0;
        else
            bitstream(2*i-1) = 1;
            bitstream(2*i) = 1;
        end
    end
end