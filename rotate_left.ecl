%% rotate_left/3

rotate(Pos,Front,Back,RotatedList,Pos) :-
  append(Back,Front,RotatedList).

rotate(Pos,Front,[BackHead|BackTail],RotatedList,Count) :-
  append(Front,[BackHead],NewFront),
  C1 is Count+1,
  rotate(Pos,NewFront,BackTail,RotatedList,C1).

rotate_left_aux(Pos,[Head|Tail],RotatedList) :-
  rotate(Pos,[Head],Tail,RotatedList,1).

rotate_left(Pos,List,RotatedList) :- 
  rotate_left_aux(Pos,List,RotatedList).



