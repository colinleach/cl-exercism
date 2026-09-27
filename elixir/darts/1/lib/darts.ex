defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    r_sq = x*x + y*y
    cond do
      r_sq <= 1.0 -> 10
      r_sq <= 25.0 -> 5
      r_sq <= 100.0 -> 1
      true -> 0
    end
  end
end
