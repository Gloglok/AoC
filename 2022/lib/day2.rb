require_relative "aoc"

class Day2 < AOC
  def solve(part:)
    data = load_data.split("\n")
    if part == 1
      scores = {
        "A X": 4,
        "B X": 1,
        "C X": 7,
        "A Y": 8,
        "B Y": 5,
        "C Y": 2,
        "A Z": 3,
        "B Z": 9,
        "C Z": 6
      }
      data.map { scores[_1.to_sym] }.sum
    else
      scores = {
        "A X": 3,
        "B X": 1,
        "C X": 2,
        "A Y": 4,
        "B Y": 5,
        "C Y": 6,
        "A Z": 8,
        "B Z": 9,
        "C Z": 7
      }
      data.map { scores[_1.to_sym] }.sum
    end
  end
end
