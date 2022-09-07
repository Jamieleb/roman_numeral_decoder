defmodule RomanNumeralDecoder do
  @moduledoc """
  A module to work with conversions of Roman Numerals to integers
  """

  @roman_numeral_map %{
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  def decode(numerals, total \\ 0)
  def decode("", total), do: total

  def decode(numerals, total) when byte_size(numerals) == 1,
    do: total + numeral_char_to_int(numerals)

  def decode(numerals, total) do
    [first, second | tail] = String.codepoints(numerals)

    [first_value, second_value] = Enum.map([first, second], &numeral_char_to_int/1)

    if second_value > first_value do
      decode(Enum.join(tail, ""), total + second_value - first_value)
    else
      decode(Enum.join([second | tail], ""), total + first_value)
    end
  end

  def numeral_char_to_int(char) do
    @roman_numeral_map[char]
  end
end
