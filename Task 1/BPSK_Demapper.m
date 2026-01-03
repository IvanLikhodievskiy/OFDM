function bitstream = BPSK_Demapper(signal)
    % Map a bit combination to an IQ point using QPSK rule
    bitstream = zeros(1, length(signal));
    
    for i = 1:length(signal)
        if real(signal(i)) < 0
            bitstream(i) = 0;
        else
            bitstream(i) = 1;
        end
    end
end