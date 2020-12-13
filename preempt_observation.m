function observes = preempt_observation(tree,idxHypotheses,xGoal)
% takes metrics calculated during tree generation, returns struct of
% randomly permuted observations attributed to each motion path
    nObs = numel(idxHypotheses);
    observes = repmat(struct('idxEnd',-1,'obs',struct('d',-1,'col',-1)),nObs,1);
    
    % calculate obs
    
    
    % randomly permute
    observes = observes(randperm(nObs));
end

