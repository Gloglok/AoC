require_relative "aoc"

class Day1 < AOC
  def solve(part:)
    data = load_data.split("\n\n").map { |elf| elf.split("\n") }
    if part == 1
      data.map { |elf|
        elf.map(&:to_i).sum
      }.max
    else
      data.map { |elf|
        elf.map(&:to_i).sum
      }.max(3).sum
    end
  end
end
