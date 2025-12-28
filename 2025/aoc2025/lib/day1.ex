defmodule Day1 do
  @moduledoc """
  Advent of Code 2025 - Day 1
  """
  @default_max_pos 100
  @default_initial_pos 50

  @doc """
  Parses the input file and converts it to a list of moves.
  L prefix indicates left (negative), R prefix indicates right (positive).
  """
  def parse_input(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "L" <> num -> -String.to_integer(num)
      "R" <> num -> String.to_integer(num)
    end)
  end

  @doc """
  For each move, update the position of the lock, going to 0 from 99 or 99 to 0
  Then check if the lock is exactly at 0, and if so increments the result
  """
  def part1(moves, max_pos \\ @default_max_pos, initial_pos \\ @default_initial_pos) do
    {_final_pos, result} = Enum.reduce(moves, {initial_pos, 0}, fn move, {pos, count} ->
      new_pos = Integer.mod(pos + move, max_pos)
      new_count = if new_pos == 0, do: count + 1, else: count
      {new_pos, new_count}
    end)

    result
  end

  @doc """
  For each move, update the position of the lock, going to 0 from 99 or 99 to 0
  Then check how many times the lock passed before 0 exactly and increments the result by that amount
  """
  def part2(moves, max_pos \\ @default_max_pos, initial_pos \\ @default_initial_pos) do
    {_final_pos, result} = Enum.reduce(moves, {initial_pos, 0}, fn move, {pos, count} ->
      new_pos = Integer.mod(pos + move, max_pos)

      # Count how many times we passed through 0
      passes = count_zero_crossings(pos, move, max_pos)

      {new_pos, count + passes}
    end)

    result
  end

  defp count_zero_crossings(pos, move, max_pos) when move > 0 do
    complete_wraps = div(move, max_pos)
    partial_cross = if pos + rem(move, max_pos) >= max_pos, do: 1, else: 0
    complete_wraps + partial_cross
  end
  defp count_zero_crossings(pos, move, max_pos) when move < 0 do
    complete_wraps = div(-move, max_pos)
    remainder = rem(move, max_pos)
    # Count partial cross if we go to/past 0, but not if we're starting at 0
    partial_cross = if remainder != 0 and pos + remainder <= 0 and pos != 0, do: 1, else: 0
    complete_wraps + partial_cross
  end
  defp count_zero_crossings(_pos, 0, _max_pos), do: 0

  def main(_args) do
    moves =
      Path.join([__DIR__, "../data/day1.txt"])
      |> parse_input()

    IO.puts("Part 1: #{part1(moves)}")
    IO.puts("Part 2: #{part2(moves)}")
  end
end
