%% fn/2
%% fn(N,X)
fn(N,X):-
    (N=0, X=1);
    (N>0, N<5, X=N);
    (N>=5, N=<8, N1 is N-4, fn(N1,X1), X is 2*X1);
    (N>8, N2 is N-8, fn(N2,X2), N3 is X2, fn(N3,X3), X is X3).

%% f(n) =
%% 1            for n=0
%% n            for 0<n<5
%% 2*f(n-4)     for 5<=n<=8
%% f(f(n-8))    for n>8
