leap(Year) :- (Year mod 400) =:= 0.
leap(Year) :- (Year mod 4) =:= 0, (Year mod 100) =\= 0.
