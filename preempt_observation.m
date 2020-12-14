function observes = preempt_observation(tree,idxHypotheses,xGoal)
% takes metrics calculated during tree generation, returns struct of
% randomly permuted observations attributed to each motion path
    nObs = numel(idxHypotheses);
    observes = repmat(struct('idxEnd',-1,'obs',struct('d',-1,'col',-1)),nObs,1);
    
    dStartToGoal = norm(xGoal-tree(1).x);
    
    for iObs = 1:nObs
        % including node / hypothesis index in tree for easy referencing
        % after permutation of observation order
        observes(iObs).idxEnd = idxHypotheses(iObs);
        
        dNodeToGoal = norm(xGoal-tree(idxHypotheses(iObs)).x);

        %%%%% calculate obs %%%%%
        % closeness of path to straight line between start and goal,
        % proportional to dist to goal normalized by path length. Takes on
        % between -1 and 1, with 1 being most optimal.
        observes(iObs).obs.d = (dStartToGoal-dNodeToGoal)/tree(idxHypotheses(iObs)).obs.dist;
        
        %
        
        
    end
    
    % randomly permute
    observes = observes(randperm(nObs));
end

