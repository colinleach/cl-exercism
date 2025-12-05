let egg_count number =
  let rec to_bits n =
    if n = 0 then []
    else (n land 1) :: to_bits (n lsr 1)
  in let sum lst = List.fold_left (+) 0 lst
  in number |> to_bits |> sum
