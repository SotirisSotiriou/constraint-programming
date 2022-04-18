/*---------------------------------------------------------------------------
  This code is part of the book
  LOGIC PROGRAMMING TECHNIQUES: THE PROLOG LANGUAGE
  Ilias Sakellariou, Nikos Bassiliades, Petros Kefalas, Demosthenes Stamatis
  Hellenic Academic On-line Publications, 2015
----------------------------------------------------------------------------*/

%%% word/5
%%% word(Word,Letter1,...,Letter4).
%%% Encodes words in letters

word(jumbo,j,u,m,b,o).
word(jocks,j,o,c,k,s).
word(isles,i,s,l,e,s).
word(jumps,j,u,m,p,s).
word(babel,b,a,b,e,l).

%%% crossword/5
%%% crossword(W1,W2,W3,W4,W5)
%%% Finds 5 words that fit in the puzzle.
crossword(W1,W2,W3,W4,W5):-
	word(W1,_,L1,_,_,L2),
	word(W2,_,L3,_,_,L4),
	word(W3,_,L1,_,L5,L3),
        word(W4,_,L2,_,L6,L4),
        word(W5,L5,_,_,L6,_).

