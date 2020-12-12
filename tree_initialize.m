function tree = tree_initialize(xStart,k)
    tree = repmat(struct('parent',[],'children',[],'edge',[],'x',[]),k,1);
    tree(1).parent = 0;
    tree(1).x = xStart;
end