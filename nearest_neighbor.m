function idxNear = nearest_neighbor(tree,xRand)
% using vector norm, find nearest node on tree to sampled point
    [~,idxNear] = min(vecnorm([tree.x]-xRand));
end