require_relative "aoc"

class Day4 < AOC
  def solve(part:)
    data = load_data.split("\n")
      .map { |line|
        line.split(",").map { |elf|
          elf.split("-").map(&:to_i)
        }
      }
    if part == 1
      data.map { |pair|
        (pair[0][0] <= pair[1][0]) && (pair[0][1] >= pair[1][1]) ||
          (pair[0][0] >= pair[1][0]) && (pair[0][1] <= pair[1][1])
      }.count(true)
    else
      data.map { |pair|
        ((pair[0][0]..pair[0][1]).cover? pair[1][0]) ||
          ((pair[0][0]..pair[0][1]).cover? pair[1][1]) ||
          ((pair[1][0]..pair[1][1]).cover? pair[0][0]) ||
          ((pair[1][0]..pair[1][1]).cover? pair[0][1])
      }.count(true)
    end
  end
end
