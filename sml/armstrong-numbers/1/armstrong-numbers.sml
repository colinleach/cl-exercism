fun isArmstrongNumber (number: int): bool =
  let
    fun toDigits(n, digits) = 
      case n of
        0 => digits
      | _ => toDigits(n div 10, (n mod 10)::digits)

    val digits = toDigits(number, [])
    val countDigits = length digits

    fun pow (base, 0) = 1
      | pow (base, exp) = base * pow (base, exp - 1)
    val rasedDigits = map (fn x => pow(x, countDigits)) digits
  in
    (foldl op+ 0 rasedDigits) = number
  end
  