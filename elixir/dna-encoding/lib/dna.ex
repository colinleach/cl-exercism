defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001-> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
 end

  def encode(dna), do: do_encode(dna, <<>>)

  def do_encode(dna, code) do
    case dna do
      '' -> code
      [head | tail] -> do_encode(tail, <<code::bitstring, encode_nucleotide(head)::4>>)
    end
  end

  def decode(dna), do: do_decode(dna, '')

  def do_decode(packed, seq) do
    case packed do
      <<>> -> Enum.reverse(seq)
      <<first::4, rest::bitstring>> -> [do_decode(rest, decode_nucleotide(first)) | seq]
    end
  end
end
