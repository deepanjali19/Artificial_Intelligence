factorial(0,1).

factorial(Number, Result):-
	Number>0,
		Number_1 is Number-1,
		factorial(Number_1,Result_1),
		Result is Number*Result_1.
