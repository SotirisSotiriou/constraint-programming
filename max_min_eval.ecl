%% max_min_eval/2
%% max_min_eval(List,Resultult)
max_min_eval([First|Tail], Result):-
  max_min_eval(Tail, First, Result).
  
max_min_eval([],Result, Result).
max_min_eval([Op, R|Tail], L, Result):-
  max_min_eval_op(Op, L, R, L1),
  max_min_eval(Tail, L1, Result).

max_min_eval_op(max, L, R, Result):-
  max(L, R, Result).
max_min_eval_op(min, L, R, Result):-
  min(L, R, Result).