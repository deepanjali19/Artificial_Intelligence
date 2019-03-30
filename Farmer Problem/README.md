Consider the famous problem of a farmer having a goat, a wolf, and a cabbage. The farmer wants to cross the river from the east shore to the west shore, but his boat is small. The boat has space for only the farmer with one of the items: cabbage, wolf, or goat. The farmer cannot leave the wolf alone with the goat or the goat alone with the cabbage.

The state space for this problem can be represented by the different situations of the four subjects that can be at any time either on the east or the west shore, but when  moving from one state to another the items are subject to the conditions specified in the previous paragraph.

We can represent a state space by the relation s(X, Y), which is true only if there is a legal move from state X to state Y within the specified conditions.

Each state can be represented by the tuple (FP, GP, WP, CP), where the variables FP, GP, WP, CP can have only two values (e, w), which indicate the position east or west of the farmer, goat, wolf, and cabbage.

The initial state of the system can be represented by (e, e, e, e), where all subjects are on the east side.

The goal state of the system can be represented by (w, w, w, w), where all subjects have been moved to the west side.

Other intermediate states will be represented using combinations of these positions (e,w).

This repository has a depth-first search program with cycle detection to find and display different solution paths for the farmer problem.
This repository has a breadth-first search program with cycle detection to find and display different solution paths for the farmer problem.

All data about the state space and the initial state of the system is defined in the program as facts.
