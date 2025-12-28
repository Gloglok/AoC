defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  describe "parse_input/1" do
    test "parses input" do
      path = Path.join([__DIR__, "day1_test.txt"])

      assert Day1.parse_input(path) == [
               -50,
               100,
               -200,
               300,
               -101,
               102,
               -102,
               101,
               1,
               -1,
               -1,
               2,
               -2
             ]
    end
  end

  describe "part1/1" do
    test "counts exact landings on position 0" do
      # Starting at 50, move right 50 should land on 0
      moves = [50]
      assert Day1.part1(moves) == 1
    end

    test "counts multiple landings on 0" do
      # Start at 50, right 50 (lands on 0), right 100 (lands on 0 again)
      moves = [50, 100]
      assert Day1.part1(moves) == 2
    end

    test "does not count near misses" do
      # Start at 50, right 49 (lands on 99, not 0)
      moves = [49]
      assert Day1.part1(moves) == 0
    end

    test "works with left moves" do
      # Start at 50, left 50 (lands on 0)
      moves = [-50]
      assert Day1.part1(moves) == 1
    end

    test "handles wrapping" do
      # Start at 50, left 150 = wraps around and lands on 0 (50 - 150 = -100, mod 100 = 0)
      moves = [-150]
      assert Day1.part1(moves) == 1
    end

    test "works with custom max_pos and initial_pos" do
      # Smaller lock: 0-9 (max_pos=10), starting at 5
      # Move right 5 should land on 0
      moves = [5]
      assert Day1.part1(moves, 10, 5) == 1
    end
  end

  describe "part2/1" do
    test "counts crossing zero when moving right" do
      # Start at 50, move right 60: crosses 0 once (50+60=110, wraps to 10)
      moves = [60]
      assert Day1.part2(moves) == 1
    end

    test "counts multiple crossings in one move" do
      # Start at 50, move right 150: crosses 0 twice (complete wrap + partial)
      moves = [150]
      assert Day1.part2(moves) == 2
    end

    test "counts crossing zero when moving left" do
      # Start at 50, move left 60: crosses 0 once
      moves = [-60]
      assert Day1.part2(moves) == 1
    end

    test "does not count if move doesn't cross zero" do
      # Start at 50, move right 40: lands at 90, no crossing
      moves = [40]
      assert Day1.part2(moves) == 0
    end

    test "does count only one crossing when doing a full wrap from 0" do
      # Start at 50, move right 40: lands at 90, no crossing
      moves = [-100]
      assert Day1.part2(moves, 100, 0) == 1
    end

    test "counts crossings across multiple moves" do
      # Multiple moves that each cross zero
      moves = [60, -120]
      # First move: 50+60=110 (1 crossing to position 10)
      # Second move: 10-120=-110, mod 100 = 90 (2 crossings: complete wrap + partial)
      assert Day1.part2(moves) == 3
    end
  end
end
