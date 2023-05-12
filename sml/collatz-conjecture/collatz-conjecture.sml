 fun step (n, stepcount) =
    if n = 1 then
      stepcount
    else
      let 
        val newnum = 
          case n mod 2 of
            0 => n div 2
          | _ => 3 * n + 1
      in 
        step (newnum, (stepcount + 1))
      end
    
fun collatz n =
    if n < 1 then
      NONE
    else
      SOME (step (n, 0))
