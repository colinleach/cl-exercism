def score (x: f64) (y: f64): i32 = 
    let r_sq = x*x + y*y
    in if r_sq <= 1.0 then 10        -- Inner circle (radius 1)
       else if r_sq <= 25.0 then 5   -- Middle circle (radius 5)  
       else if r_sq <= 100.0 then 1  -- Outer circle (radius 10)
       else 0                        -- Outside target

