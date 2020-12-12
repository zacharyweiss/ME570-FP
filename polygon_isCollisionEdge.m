%function [flagIsCollision]=polygon_isCollisionEdge(edge,vertices)
%Uses the function [flagIsCollision]edge_isCollision from Homework 1 to check
%whether an edge is in collision with a polygon.
function [flagIsCollision]=polygon_isCollisionEdge(edge,vertices)
   nPairs = size(vertices,2);
   
   flagIsCollision = edge_isCollision(edge,[vertices(:,nPairs) vertices(:,1)]);

   for iEdge = 1:nPairs-1
        flagIsCollision = any([edge_isCollision(edge,vertices(:,iEdge:iEdge+1)) flagIsCollision]);
   end
   
   %flagIsCollision = any([polygon_isCollision(edge,vertices) flagIsCollision]);

   [inPoly, onPoly] = inpolygon(edge(1,:),edge(2,:),vertices(1,:),vertices(2,:));
   if polygon_isFilled(vertices)
       if all(inPoly) && ~all(onPoly)
           flagIsCollision = true;
       end
   else
       if all(~inPoly) && ~all(onPoly)
           flagIsCollision = true;
       end
   end
end