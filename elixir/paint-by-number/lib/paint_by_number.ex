defmodule PaintByNumber do
  def palette_bit_size(color_count), do: palette_bit_size(color_count, 0)

  defp palette_bit_size(color_count, power) do
    if 2**power >= color_count do
      power
    else
      palette_bit_size(color_count, power + 1)
    end
  end

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index), do:
     <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>

  def get_first_pixel(picture, color_count) do
    n = palette_bit_size(color_count)
    case picture do
      <<first::size(n), _rest::bitstring>> -> first
      <<>> -> nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    n = palette_bit_size(color_count)
    case picture do
      <<_first::size(n), rest::bitstring>> -> rest
      <<>> -> <<>>
    end
  end

  def concat_pictures(picture1, picture2), do:
    <<picture1::bitstring, picture2::bitstring>>
end
