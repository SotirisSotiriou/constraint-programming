%% seperate_lists/3
%% seperate_lists(List,Lets,Nums)

seperate_lists([], [], []) . 


seperate_lists([X|Xs] , [X|Lets] , Nums) :- 
  not(number(X)),
  !, 
  seperate_lists(Xs,Lets,Nums). 


seperate_lists( [X|Xs] , Lets, [X|Nums] ) :- 
  number(X),  
  !, 
  seperate_lists(Xs,Lets,Nums). 


seperate_lists([_|Xs], Lets, Nums) :-
  seperate_lists(Xs,Lets,Nums). 

