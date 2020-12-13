# ME570-FP
Final project for ME570 (Robot Motion Planning): Preemptive Rapidly-Exploring Random Trees

Implements a preemption scheme inspired by Preemptive RANSAC [Nister 2005] onto the original RRT algorithm [LaValle 1998]. Designed to be abstractable for use with other "observation" metrics, RRT implementations, and preemption functions.

main.m generates a RRT over the polygonal environment provided in polygonalWorld.mat, and upon reaching an iteration cap, returns the path deemed most likely to succeed in reaching the goal (and succeed most optimally) when completed, and plots the tree, environment, and returned path in a single figure.
