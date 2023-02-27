defmodule Username do
  def sanitize_helper(input, output) do
    case input do
      [] -> output
      [hd | tl] -> case hd do
        hd when hd >= ?a and hd <= ?z -> sanitize_helper(tl, output ++ [hd])
        ?_ -> sanitize_helper(tl, output ++ [hd])
        ?ä -> sanitize_helper(tl, output ++ 'ae')
        ?ö -> sanitize_helper(tl, output ++ 'oe')
        ?ü -> sanitize_helper(tl, output ++ 'ue')
        ?ß -> sanitize_helper(tl, output ++ 'ss')
        _ -> sanitize_helper(tl, output)
      end
    end
  end

  def sanitize(username) do
    case username do
      [] -> ''
      _ -> sanitize_helper(username, '')
    end
  end
end
