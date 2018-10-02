myCode(Num, List, Index):-
	mySubCode(Num, List, Index, 1).

mySubCode(_, [], [], _).

mySubCode(Num, [Num|Tail], [I|Index], I):-
	I1 is I+1,
	mySubCode(Num, Tail, Index, I1).

mySubCode(Num, [Head|Tail], Index, I):-
	not(Num is Head),
		I1 is I+1,
		mySubCode(Num, Tail, Index, I1).
