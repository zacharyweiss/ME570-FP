%function polygonworld_draw(world,xGoal)
%Uses polygon_draw from Homework 1 to draw the polygonal obstacles together with
%a  * marker at the goal location.
function polygonworld_draw(world,xGoal)
nbPolygon = size(world,2);
flagHold=ishold();
hold on
for iPoly = 1:nbPolygon
    polygon_plot(world(iPoly).vertices,'k')
end
plot(xGoal(1,1),xGoal(2,1),'x','Color','r')
if ~flagHold
    hold off
end
