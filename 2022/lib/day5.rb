require_relative "aoc"

class Day5 < AOC
  # [N] [G]                     [Q]
  # [H] [B]         [B] [R]     [H]
  # [S] [N]     [Q] [M] [T]     [Z]
  # [J] [T]     [R] [V] [H]     [R] [S]
  # [F] [Q]     [W] [T] [V] [J] [V] [M]
  # [W] [P] [V] [S] [F] [B] [Q] [J] [H]
  # [T] [R] [Q] [B] [D] [D] [B] [N] [N]
  # [D] [H] [L] [N] [N] [M] [D] [D] [B]
  #  1   2   3   4   5   6   7   8   9

  STACKS = {}
  STACKS[1] = %w[D T W F J S H N]
  STACKS[2] = %w[H R P Q T N B G]
  STACKS[3] = %w[L Q V]
  STACKS[4] = %w[N B S W R Q]
  STACKS[5] = %w[N D F T V M B]
  STACKS[6] = %w[M D B V H T R]
  STACKS[7] = %w[D B Q J]
  STACKS[8] = %w[D N J V R Z H Q]
  STACKS[9] = %w[B N H M S]

  def solve(part:)
    data = load_data.split("\n")
      .map { |line| line.split(" ").odd_values.map(&:to_i) } # Maps each line to an array of the number values
    if part == 1
      data.each { |line|
        line[0].times {
          STACKS[line[2]] += STACKS[line[1]].pop(1)
        }
      }
    else
      data.each { |line|
        STACKS[line[2]] += STACKS[line[1]].pop(line[0])
      }
    end
    STACKS.each_value.map(&:last).join
  end
end
