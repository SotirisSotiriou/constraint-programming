%% sum([...], L)
%% sum/2
sum_even([],0).

sum_even([Head|Tail],L):- 
    sum_even(Tail,L1), 
    0 is Head mod 2,
    L is L1+Head.

sum_even([Head|Tail],L):- 
    sum_even(Tail,L1), 
    \+ 0 is Head mod 2,
    L is L1.