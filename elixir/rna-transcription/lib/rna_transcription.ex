defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    to_rna(dna, '')
  end

  def to_rna([], rna) do
    Enum.reverse(rna)
  end

  def to_rna([head | tail], rna) do
    translation = case head do
      ?G -> 'C'
      ?C -> 'G'
      ?T -> 'A'
      ?A -> 'U'
    end
    to_rna(tail, translation ++ rna)
  end

end
