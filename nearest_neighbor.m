function idxNear = nearest_neighbor(tree,xRand)
% using vector norm, find nearest node on tree to sampled point
    [~,idxNear] = min(vecnorm([tree.x]-xRand));
    if numel(idxNear)>1
        idxNear = idxNear(1);
    end
end