function nHypothesesRemaining = preempt_function(iter,nHypotheses)
% Returns number of hypotheses to be kept at any given iteration of
% preemption scheme. Mirrors: Nister 2005.
    % block size before next reordering
    B = 3;
    % output only changes after every B iterations
    nHypothesesRemaining = floor(nHypotheses*(2^(-floor(iter/B))));
end

