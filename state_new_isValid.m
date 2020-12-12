function isValidConfig = state_new_isValid(world,xNew,xNear)
% Checks point and edge for collision with polygons
    edge = [xNear xNew];
    
    isValidConfig = true;
    for iPoly = 1:numel(world)
        isValidConfig = ~polygon_isCollisionEdge(edge,world(iPoly).vertices);
        isValidConfig = isValidConfig && ~polygon_isCollision(world(iPoly).vertices,xNew);
        if ~isValidConfig
            break
        end
    end
end

