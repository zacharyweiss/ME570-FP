function xRand = random_state(world)
% Bound random states to min/max along all dimensions of world
% Generates and returns random state within bounds
    verts = [world.vertices]';
    xMin = min(verts)';
    xMax = max(verts)';
    xRand = random('uniform',xMin,xMax);
end