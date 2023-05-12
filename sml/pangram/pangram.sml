fun isPangram s =
  let val s_lower = String.map Char.toLower s
      val letters = String.explode "abcdefghijklmnopqrstuvwxyz"
  in List.all (fn c => (Char.contains s_lower c)) letters
  end

      

