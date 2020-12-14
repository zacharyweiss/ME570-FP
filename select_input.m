function u = select_input(xRand,xNear,deltaT)
% Defines control input to move towards random pt
% This implementation only considers holonomic planning, where f(x,u) = u,
% and that norm(u) <= 1.
% To modify for nonholonomic, one must consider what u satisfies 
% x_dot = f(x,u) S.T. on integration it will move the system towards xRand
    vec = xRand-xNear;
    u = vec/norm(vec);
    
    % if point is <deltaT away from node, make u proportional to distance
    if deltaT > norm(vec)
        u = vec/deltaT;
    end
end