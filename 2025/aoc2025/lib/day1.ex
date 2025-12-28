defmodule Day1 do
  @moduledoc """
  Advent of Code 2025 - Day 1
  """

  defp parse_input() do
    File.read!(Path.join([__DIR__, "../data/day1.txt"]))
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "L" <> num -> -String.to_integer(num)
      "R" <> num -> String.to_integer(num)
    end)
  end

  def part1(moves, max_pos \\ 100, initial_pos \\ 50) do
    result = 0

    # For each move, update the position of the lock, going to 0 from 99 or 99 to 0
    # Then check if the lock is exactly at 0, and if so increments the result
    {_final_pos, result} = Enum.reduce(moves, {initial_pos, result}, fn move, {pos, count} ->
      new_pos = Integer.mod(pos + move, max_pos)
      new_count = if new_pos == 0, do: count + 1, else: count
      {new_pos, new_count}
    end)

    result
  end

  def part2(moves, max_pos \\ 100, initial_pos \\ 50) do

    # For each move, update the position of the lock, going to 0 from 99 or 99 to 0
    # Then check how many times the lock passed before 0 exactly and increments the result by that amount
    {_final_pos, result} = Enum.reduce(moves, {initial_pos, 0}, fn move, {pos, count} ->
      new_pos = Integer.mod(pos + move, max_pos)

      # Count how many times we passed through 0
      passes = count_zero_crossings(pos, move, max_pos)

      {new_pos, count + passes}
    end)

    result
  end

  defp count_zero_crossings(pos, move, max_pos) do
    cond do
      move > 0 ->
        complete_wraps = div(move, max_pos)
        partial_cross = if pos + rem(move, max_pos) >= max_pos, do: 1, else: 0
        complete_wraps + partial_cross

      move < 0 ->
        complete_wraps = div(-move, max_pos)
        remainder = rem(move, max_pos)
        # Count partial cross if we go to/past 0, but not if we're starting at 0
        partial_cross = if remainder != 0 and pos + remainder <= 0 and pos != 0, do: 1, else: 0
        complete_wraps + partial_cross

      # No move
      true ->
        0
    end
  end

  def main(_args) do
    moves = parse_input()

    result = part1(moves)
    IO.puts("Part 1: #{result}")

    result = part2(moves)
    IO.puts("Part 2: #{result}")
  end
end
