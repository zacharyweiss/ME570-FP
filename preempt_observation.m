function observes = preempt_observation(tree,idxHypotheses,xGoal)
% takes metrics calculated during tree generation, returns struct of
% randomly permuted observations attributed to each motion path
    nObs = numel(idxHypotheses);
    observes = repmat(struct('idxHyp',[],'str',[],'col',[],'dGoal',[],'nNode',[]),nObs,1);
    
    dStartToGoal = norm(xGoal-tree(1).x);
    
    for iObs = 1:nObs
        % including node / hypothesis index in tree for easy referencing
        % after permutation of observation order
        observes(iObs).idxHyp = idxHypotheses(iObs);
        
        pathLen = tree(idxHypotheses(iObs)).obs.dist;
        collisions = tree(idxHypotheses(iObs)).obs.col;
        nNodes = tree(idxHypotheses(iObs)).obs.nodes;
        dNodeToGoal = norm(xGoal-tree(idxHypotheses(iObs)).x);

        %%%%% calculate obs %%%%%
        % closeness of path to straight line between start and goal,
        % proportional to dist to goal normalized by path length. Takes on
        % between [-1,1] with 1 being most optimal.
        observes(iObs).str = (dStartToGoal-dNodeToGoal)/pathLen;
        
        % collisions normalized by total attempted expansions along path,
        % represented by sum of nodes and failed node attempts off of nodes
        % on path. Takes on between [0,1) with 0 most optimal.
        observes(iObs).col = collisions/(nNodes+collisions);
        
        observes(iObs).dGoal = dNodeToGoal;
        
        observes(iObs).nNode = nNodes;
    end
    
    % randomly permute set of observations before returning
    observes = observes(randperm(nObs));
end

