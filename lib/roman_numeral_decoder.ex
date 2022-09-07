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

  def decode(numerals) do
    numeral_value_list =
      numerals
      |> String.codepoints()
      |> Enum.map(&@roman_numeral_map[&1])

    decode_recursive(numeral_value_list, 0)
  end


  defp decode_recursive([], total), do: total

  defp decode_recursive([value], total), do: total + value

  defp decode_recursive([first, second | tail], total) do
    cond do
      second > first -> decode_recursive(tail, total + second - first)
      true -> decode_recursive([second | tail], total + first)
    end
  end

  defp numeral_char_to_int(char) do
    @roman_numeral_map[char]
  end
end
