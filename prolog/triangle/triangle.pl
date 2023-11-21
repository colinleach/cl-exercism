is_triangle(Side1, Side2, Side3) :-
    Side1 > 0, Side2 > 0, Side3 > 0,
    Sides12 is Side1 + Side2,
    Sides23 is Side2 + Side3,
    Sides13 is Side1 + Side3,
    (Sides12 > Side3),
    (Sides23 > Side1),
    (Sides13 > Side2).

triangle(X, X, Y, "isosceles") :- is_triangle(X, X, Y), !.
triangle(X, Y, Y, "isosceles") :- is_triangle(X, Y, Y), !.
triangle(Y, X, Y, "isosceles") :- is_triangle(Y, X, Y), !.

triangle(X, X, X, "equilateral") :- is_triangle(X, X, X), !.
 
triangle(Side1, Side2, Side3, "scalene") :-
    is_triangle(Side1, Side2, Side3),
    Side1 =\= Side2, 
    Side1 =\= Side3, 
    Side2 =\= Side3.
