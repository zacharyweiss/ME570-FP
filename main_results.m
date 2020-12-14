% load world
load('polygonWorld.mat','world','xGoal','xStart')

% settings
nVerts = 200;   % number of vertices to build tree to before preempting
deltaT = 0.05;   % stepsize of tree, best on order of 0.01-0.1
iStart = 1;      % start position, anywhere from 1-5

% generate RRT with observation metrics for preemption
tree = rrt_generate(world,xStart(:,iStart),nVerts,deltaT);
% plot RRT and polygonal world
rrt_plot(world,tree)

% find preemptive best path at time of nVerts cutoff
xPath = preempt_path(tree,xGoal);
% overlay path, goal, and shortest path w/o obstacles on plot
hold on
plot(xPath(1,:),xPath(2,:),'g-')
plot([xPath(1,1) xGoal(1)],[xPath(2,1) xGoal(2)],'b-')
plot(xGoal(1),xGoal(2),'rx')