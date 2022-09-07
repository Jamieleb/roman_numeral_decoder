defmodule RomanNumeralDecoderTest do
  use ExUnit.Case
  doctest RomanNumeralDecoder

  test "Should equal 1" do
    assert RomanNumeralDecoder.decode("I") == 1
  end

  test "Should equal 4" do
    assert RomanNumeralDecoder.decode("IV") == 4
  end

  test "Should equal 42" do
    assert RomanNumeralDecoder.decode("XLII") == 42
  end

  test "Should equal 123" do
    assert RomanNumeralDecoder.decode("CXXIII") == 123
  end

  test "Should equal 1666" do
    assert RomanNumeralDecoder.decode("MDCLXVI") == 1666
  end

  test "Should equal 2022" do
    assert RomanNumeralDecoder.decode("MMXXII") == 2022
  end
end
