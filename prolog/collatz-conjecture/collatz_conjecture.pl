:- use_module(library(clpfd)).

step(1, Steps, Counter) :- Steps #= Counter. 

step(N, Steps, Counter) :-
    N #= 2 * N1,
    step(N1, Steps, Counter + 1), !. 

step(N, Steps, Counter) :-
    N #= 2*_ + 1,
    N1 #= 3 * N + 1,
    step(N1, Steps, Counter + 1). 

collatz_steps(N, Steps) :-
    N #< 1, !, fail;
    step(N, Steps, 0).
