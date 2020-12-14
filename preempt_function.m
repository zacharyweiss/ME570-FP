function nHypothesesRemaining = preempt_function(iter,nHypotheses,blockSize)
% Returns number of hypotheses to be kept at any given iteration of
% preemption scheme. Mirrors: Nister 2005.
    % output only changes after every blockSize iterations
    nHypothesesRemaining = floor(nHypotheses*(1.5^(-floor(iter/blockSize))));
end

