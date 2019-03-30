%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       acyclic.pl                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Taking node A, node Z and graph values from the user
% Sending the values as arguments to find acyclic path
% Printing determined path on the screen

start :-
	write('Enter node A: '),
	read(NodeA),
	
	write('Enter node Z: '),
	read(NodeZ),
	
	write('Enter graph(Nodes,Edges): '),
	read(Graph),
	
	acyclic(NodeA, NodeZ, Graph, Path),
	
	write('Acyclic path is: '),
	write(Path).

% it passes arguments to acyclic_path rule

acyclic(A, Z, Graph, Path) :-
	acyclic_path(A, [Z], Graph, Path).

% acyclic_path finds the final path between the node A and node Z
% graph is a function symbol where Nodes is list of nodes and,
% Edges is list of directed edges in the graph

acyclic_path(A, [A | Path1], _, [A | Path1]).

acyclic_path(A, [Y | Path1], graph(Nodes, Edges), Path) :-
	member(c(X, Y), Edges),
    not(member(X, Path1)),
    acyclic_path(A, [X ,Y|Path1], graph(Nodes, Edges), Path).

% checks if node is member of provided edges

member(X, [X | _]).

member(X, [_ | T]) :-
	member(X, T).
	