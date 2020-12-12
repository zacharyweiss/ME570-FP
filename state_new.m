function xNew = state_new(xNear,u,deltaT)
% moves deltaT in direction of control input u from xNear
    xNew = xNear + u*deltaT;
end