%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        cost.pl                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% declaring valid edges as facts 

edge(a, b, 3).
edge(b, c, 1).
edge(b, d, 5).
edge(c, d, 2).
edge(d, b, 2).

% Taking node X and node Y from the user
% Sending the values as arguments to find cheapest path
% Printing determined path and cost on the screen

start :-
	write('Enter node X: '),
	read(NodeX),
	
	write('Enter node Y: '),
	read(NodeY),

	cheapest(NodeX,NodeY,Path,Cost_Min),

	write('Minimum path between '),
	write(NodeX),
	write(' and '),
	write(NodeY),
	write(' is '),
	write(Path),
	write(' with cost = '),
	write(Cost_Min).

% main rule to find the cheapest path

cheapest(X, Y, Path, Cost_Min) :-
	path_cost(X, Y, Path, Cost_Min),
	not(cheaper(X, Y, _, _, Cost_Min)),
	!.

% this calculates the cost of the path given

path_cost(X, Y, Path, Cost) :-
	first_cost(X, [Y], 0, Path, Cost).

% this finds cost of the path,node by node

first_cost(X, [X | Path1], Cost_2, [X | Path1], Cost_2).

first_cost(X, [Y | Path1], Cost_2, Path, Cost) :-
	edge(A, Y, Cost_Edge),
	not(member(A, Path1)),
	Cost_3 is Cost_2 + Cost_Edge,
	first_cost(X, [A, Y | Path1], Cost_3, Path, Cost).

% this checks if there is a cheaper path existing

cheaper(X, Y, Path, Cost, Cost_Min) :-
	path_cost(X, Y, Path, Cost),
	Cost < Cost_Min.

% checks if node is member of provided edges

member(X, [X | _]).
member(X, [_ | T]) :-
	member(X, T).
