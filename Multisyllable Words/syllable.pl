%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      syllable.pl                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% declaring valid vowels as facts 

vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).
vowel(y).

% start rule to ask input from user
% calls syllable rule to break words in individual characters

start :-
	write('Enter the word: '),
	read(Word),
	
	syllable(Word).
	
% syllable rule gets the word as argument
% calls inbuilt predicate atom_chars to break the word
% calls break rule to perform actual task

syllable(Word) :-
	atom_chars(Word, Breakdown),
	break(Breakdown, [ ]),
	!.

% returns true if the character is a consonant

consonant(Char) :-
	not(vowel(Char)).

% break rule to print the output

break([ ], Output) :-
	write_output(Output).

% this rule breaks the word in vowel–consonant–vowel format

break([Char1, Char2, Char3 | Tail], Output) :-
	vowel(Char1),
	consonant(Char2),
	vowel(Char3),
	break(Tail, ['-', Char3, Char2, Char1 | Output]).

% this rule breaks the word in vowel–consonant–consonant-vowel format

break([Char1, Char2, Char3, Char4 | Tail], Output) :-
	vowel(Char1),
	consonant(Char2),
	consonant(Char3),
	vowel(Char4),
	break(Tail, [Char4, Char3, '-', Char2, Char1 | Output]).

break([Char1 | Tail], Output) :-
	break(Tail, [Char1 | Output]).

% write_output rule to print output on screen.
% second version of write_output recurses with Tail
% second version of write_output then uses inbuilt predicate write for Head

write_output([ ]).

write_output([Head | Tail]) :-
	write_output(Tail),
	write(Head).
	