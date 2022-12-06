require_relative "aoc"

class Day6 < AOC
  def solve(part:)
    data = load_data.split("\n").first.chars
    if part == 1
      chars_processed = 4
      data.each_cons(4) do |chars|
        if chars.uniq != chars
          chars_processed += 1
        else
          return chars_processed
        end
      end
    else
      chars_processed = 14
      data.each_cons(14) do |chars|
        if chars.uniq != chars
          chars_processed += 1
        else
          return chars_processed
        end
      end
    end
  end
end
