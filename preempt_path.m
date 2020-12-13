function xPath = preempt_path(tree,xGoal)
    idxHypotheses = preempt_hypotheses(tree);
    % plot leaves
    hypoX = [tree(idxHypotheses).x];
    plot(hypoX(1,:),hypoX(2,:),'o')
    
    % pick best here
    
    xPath = [];
end

