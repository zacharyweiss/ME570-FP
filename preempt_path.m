function xPath = preempt_path(tree,xGoal)
    % gather hypotheses
    idxHypotheses = preempt_hypotheses(tree);
    nHyp = numel(idxHypotheses);
    
    % plot leaves (hypotheses)
%     hypoX = [tree(idxHypotheses).x];
%     plot(hypoX(1,:),hypoX(2,:),'o')
    
    % calculate observations (from primitives in tree), permute list
    observes = preempt_observation(tree,idxHypotheses,xGoal);
    
    % compute scores L_i(h) = rho(1,h) for all hypotheses
    lHyp = preempt_score(idxHypotheses,observes);
    
    iter = 2;
    while iter<=nHyp && preempt_function(iter,nHyp,1)~=1
        % reorder hypotheses by 
        
        
        % compute scores L_i(h) = rho(1,h) for all hypotheses
        
        
        % increment iteration
        iter = iter + 1;
    end
        
    % generate path vector from index of leaf node
    xPath = tree_path(tree,idxBest);
end

