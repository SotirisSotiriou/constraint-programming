%% less_ten/1
%% less_ten(X)
less_ten(X) :- X < 10.

%% less_twenty/1
%% less_twenty(X)
less_twenty(X) :- X < 20.


%% if_then_else/3
%% if_then_else(Cond, ThenPart, ElsePart)
if_then_else( Cond, ThenPart, ElsePart):-
	call( Cond ), !, call(ThenPart).

if_then_else( Cond, ThenPart, ElsePart):-
	call(ElsePart).


%% filter/3
%% filter(C,List,Solution)
filter(_,[],[]).
filter(C,[X|Xs],Solution) :- call(C,X),!,filter(C,Xs,Solution).
filter(C,[X|Xs],[X|Solution]) :- filter(C,Xs,Solution).