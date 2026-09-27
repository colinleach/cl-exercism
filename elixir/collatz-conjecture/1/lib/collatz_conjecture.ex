require Integer

defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0, do: step(input, 0)

  @spec step(n :: pos_integer(), stepcount :: non_neg_integer()) :: non_neg_integer()
  defp step(1, stepcount), do: stepcount
  defp step(n, stepcount), do: step(Integer.is_even(n) && div(n, 2) || 3 * n + 1, stepcount + 1)
end
