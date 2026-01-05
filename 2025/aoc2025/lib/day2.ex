defmodule Day2 do
  @moduledoc """
  Advent of Code 2025 - Day 2
  """

  @doc """
  Parses the input file and converts it to a list of ranges.
  Converts "11-22,95-115,998-1012" into [11..22, 95..115, 998..1012]
  """
  def parse_input(path) do
    File.read!(path)
    |> String.split(",", trim: true)
    |> Enum.map(fn range ->
      range
      |> String.split("-", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> then(fn [first, last] -> Range.new(first, last) end)
    end)
  end

  def part1(ranges) do
    ranges
    |> Enum.reduce(0, fn range, acc ->
      range
      |> Enum.to_list()
      |> Enum.filter(fn num ->
        num
        |> Integer.to_string()
        |> is_silly?()
      end)
      |> Enum.sum()
      |> then(fn count -> acc + count end)
    end)
  end

  # Check if the string has even length and first half equals second half
  defp is_silly?(str) do
    len = String.length(str)
    half_length = div(len, 2)

    rem(len, 2) == 0 and
      String.slice(str, 0..(half_length - 1)) == String.slice(str, half_length..-1//1)
  end

  def part2(ranges) do
    ranges
    |> Enum.reduce(0, fn range, acc ->
      range
      |> Enum.to_list()
      |> Enum.filter(fn num ->
        num
        |> Integer.to_string()
        |> is_mega_silly?()
      end)
      |> Enum.sum()
      |> then(fn count -> acc + count end)
    end)
  end

  defp is_mega_silly?(str) do
    len = String.length(str)
    half_length = div(len, 2)
  end

  def main(_args) do
    Path.join([__DIR__, "../data/day2.txt"])
    |> parse_input()
    |> tap(fn ranges ->
      IO.puts("Part 1: #{part1(ranges)}")
      # IO.puts("Part 2: #{part2(ranges)}")
    end)
  end
end
