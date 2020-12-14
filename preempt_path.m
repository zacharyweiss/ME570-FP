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
    L_hyp = preempt_score(idxHypotheses,observes);
    L_order = 1:nHyp;
    
    iter = 2;
    while iter<=nHyp && preempt_function(iter,nHyp,1)~=1
        % reorder hypotheses by L_(i-1), keep f(i) of them
        [~,L_order] = sort(L_hyp(sort(L_order)),'descend');
        if numel(L_order)>preempt_function(iter,nHyp,1)
            L_order(preempt_function(iter,nHyp,1)+1:end) = [];
        end
        
        % compute scores L_i(h) = rho(1,h) for all hypotheses
        
        
        % increment iteration
        iter = iter + 1;
    end
    idxBest = L_order(1);
    
    % generate path vector from index of leaf node
    xPath = tree_path(tree,idxBest);
end

