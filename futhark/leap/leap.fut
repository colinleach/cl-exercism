def is_leap (year: i32): bool = 
    (year %% 400 == 0) || ((year %% 4 == 0) && (year %% 100 > 0))
