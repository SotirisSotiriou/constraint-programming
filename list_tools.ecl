%% equal/2
equal(L1,[]) :- false.

equal([],L2) :- false.

equal([],[]) :- true.

equal([H1|T1],[H2|T2]) :-
  H1 is H2,
  equal(T1,T2).

%% equal_parts/3
equal_parts(L,A,B) :-
  append(A,B,L),
  length(A,N),
  length(B,N).

%% parts/3
parts(L,A,B) :-
  append(A,B,L).

%% symmetric/1
symmetric(List) :-
  equal_parts(List,L1,L2),
  equal(L1,L2).

%% end_sublist/2
end_sublist(Suffix,List) :-
  parts(List,Preffix,Suffix).