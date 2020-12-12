function random_state_test()
    load polygonWorld.mat
    for i = 1:10
        figure(i)
        axis equal
        xRand = random_state(world);
        polygonworld_draw(world,xRand)
    end
end

