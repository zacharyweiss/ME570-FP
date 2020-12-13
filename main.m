% load world
load('polygonWorld.mat','world','xGoal','xStart')

% settings
nVerts = 500;   % number of vertices to build tree to
deltaT = 0.1;   % stepsize of tree
iStart = 1;     % start position, anywhere from 1-5

% generate RRT with observation metrics for preemption
tree = rrt_generate(world,xStart(:,iStart),nVerts,deltaT);
% plot RRT and polygonal world
rrt_plot(world,tree)

% find preemptive best path at time of nVerts cutoff
xPath = preempt_path(tree,xGoal);
% overlay path on plot
hold on
plot(xPath(1,:),xPath(2,:),'g-')