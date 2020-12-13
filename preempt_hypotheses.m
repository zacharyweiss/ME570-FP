function idxHypotheses = preempt_hypotheses(tree)
% returns list of hypotheses, represented by unique paths
% each unique path is fully defined by a leaf node, as such we find all
% leaves and return their indices. 
    idxHypotheses = find(arrayfun(@(struct) isempty(struct.children),tree));
end

