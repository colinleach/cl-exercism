fun convert n =
  let
    val pling = if n mod 3 = 0 then "Pling" else ""
    val plang = if n mod 5 = 0 then "Plang" else ""
    val plong = if n mod 7 = 0 then "Plong" else ""
    val ppp = pling ^ plang ^ plong
  in
    if ppp = "" then Int.toString n else ppp
  end
