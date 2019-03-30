%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Farmer Problem - Breadth First Search         %
%                        breadth.pl                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% finds solution to the famous farmer problem
% this program uses the breadth first search

% it checks if two positions are opposite of each other, i.e., East/West 
	opp(e, w).
	opp(w, e).
	
% it is called by user in order to find the route
	farmer :-
		start(state(e, e, e, e), state(w, w, w, w)).

% it prepares the empty queue and set to call the route rule
	start(Begin, End) :-
		queue_empty(Open_empty),
		enqueue([Begin, nil], Open_empty, Queue_open),
		set_empty(Set_closed),
		route(Queue_open, Set_closed, End).

% route finds the complete list fo steps needed to be completed

% it also prints the final solution
	route(Queue_open, Set_closed, End) :-
		dequeue([State, Parent], Queue_open, _),
		State = End,
		write('Here is a solution:'),
		nl,
		print_route([State, Parent], Set_closed).

% it includes many inbuilt predicates to find the route of the farmer
	route(Queue_open, Set_closed, End) :-
		dequeue([State, Parent], Queue_open, Rest_Queue_open),
		get_children(Children, Set_closed, Rest_Queue_open, State),
		list_add(Children, Rest_Queue_open, New_Queue_open),
		unify([[State, Parent]], New_Set_closed, Set_closed),
		route(New_Queue_open, New_Set_closed, End).


% it calls the inbuilt predicate bagof to backtrack the empty queue
	get_children(Children, Set_closed, Rest_Queue_open, State) :-
		bagof(Child, proceeds(State, Rest_Queue_open, Set_closed, Child), Children);
		Children = [ ].

% this rule determines if farmer can proceed with the move
% this checks if the move is risky or not
	proceeds(State, Rest_Queue_open, Set_closed, [Next, State]) :-
		proceed(State, Next),
		not(risky(Next)),
		not(queue_member([Next, _], Rest_Queue_open)),
		not(set_member([Next, _], Set_closed)).

% here are diferent cases of farmer proceeding with the boat
% this information is written into a list
	proceed(state(A, G, A, C), state(B, G, B, C)) :-
		opp(A, B),
		writelist(['attempt farmer - wolf']),
		nl.

	proceed(state(A, A, W, C), state(B, B, W, C)) :-	
		opp(A, B),
		writelist(['attempt farmer - goat']),
		nl.

	proceed(state(A, G, W, A), state(B, G, W, B)) :-
		opp(A, B),
		writelist(['attempt farmer - cabbage']),
		nl.

	proceed(state(A, G, W, C), state(B, G, W, C)) :-
		opp(A, B),
		writelist(['attempt farmer by self']),	
		nl.

% it checks if the state is risky to move forward or not
	risky(state(A, B, B, _)) :- 
		opp(A, B).

	risky(state(A, B, _, B)) :-	
		opp(A, B).

% it gets the information about each move of the farmer
	writelist([ ]).

	writelist([H | T]) :-
		write(H),
		write(' '),
		writelist(T).

% these manages the queue by adding and removing from the queue
% it also manages the queue members
	queue_empty([ ]).

	enqueue(A, [ ], [A]).

	enqueue(A, [B | C], [B | New_C]):-
		enqueue(A, C, New_C).

	dequeue(E, [E | T], T).

	queue_member([State, Parent], [[State, Parent] | _]).

	queue_member(X, [_ | T]) :-
		queue_member(X, T).

% it adds the results to the existing list using append predicate
	list_add(List, Queue, Result) :-
		append(Queue, List, Result).

% it prints the final route of the farmer
	print_route([State, nil], _) :-
		write(State),	
		nl.

	print_route([State, Parent], Set_closed) :-	
		set_member([Parent, Grandparent], Set_closed),
		print_route([Parent, Grandparent], Set_closed),
		write(State),
		nl.


% these rules set the members to the correct state
	set_empty([ ]).

	set_member([State, Parent], [[State, Parent] | _]).

	set_member(X, [_ | T]) :-
		set_member(X, T).

% it adds the given value if it is not already in the set
	addition(A, B, [A | B]).

	addition(A, B, B) :-
		member(A, B),
		!.

% it deletes the given value if it is already in the set
	deletion(_, [ ], [ ]).

	deletion(D, [D | F], F) :-
		!.

	deletion(D, [E | F], [E | New_F]) :-
		deletion(D, F, New_F), 
		!.

% it makes the union of the given value and calls the addition rule
	unify([ ], U, U).

	unify([H | T], New_U, U) :-
		unify(T, U1, U),
		addition(H, U1, New_U),
		!.

% it checks if the given value is already member of the set
	member(X, [X | _]).

	member(X, [_ | T]) :-
		member(X, T).
