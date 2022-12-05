require_relative "aoc"

class Day3 < AOC
  def solve(part:)
    data = load_data.split("\n")
    if part == 1
      data.map { |line| line.split_into_n_equal_strings(2) }
        .map { |compartment_pair| find_common_chars(compartment_pair).join }
        .map { letter_to_number(_1) }
        .sum
    else
      data.each_slice(3) # Group lines 3 by 3
        .map { |elves_group| find_common_chars(elves_group).join }
        .map { letter_to_number(_1) }
        .sum
    end
  end

  def find_common_chars(strings)
    strings.map(&:chars).reduce(:&)
  end

  # def letter_to_number_old(letter)
  #   # "a":1, "z":26, "A":27, "Z":52
  #   (letter.ord - 38) % 58
  # end

  def letter_to_number(letter)
    # "a":1, "z":26, "A":27, "Z":52
    [*("a".."z"), *("A".."Z")].index(letter) + 1
    # "A":1, "Z":26, "a":27, "z":52
    # [*("A".."Z"), *("a".."z")].index(letter) + 1
  end
end
