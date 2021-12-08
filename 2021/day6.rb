# frozen_string_literal: true

TEST_INPUT = [3, 4, 3, 1, 2].freeze
TEST_DAY1 = [2, 3, 2, 0, 1].freeze
TEST_DAY2 = [1, 2, 1, 6, 0, 8].freeze
TEST_DAY3 = [0, 1, 0, 5, 6, 7, 8].freeze

INPUT = [1, 4, 3, 3, 1, 3, 1, 1, 1, 2, 1, 1, 1, 4, 4, 1, 5, 5, 3, 1, 3, 5, 2, 1, 5, 2, 4, 1, 4, 5, 4, 1, 5, 1, 5, 5, 1,
         1, 1, 4, 1, 5, 1, 1, 1, 1, 1, 4, 1, 2, 5, 1, 4, 1, 2, 1, 1, 5, 1, 1, 1, 1, 4, 1, 5, 1, 1, 2, 1, 4, 5, 1, 2, 1,
         2, 2, 1, 1, 1, 1, 1, 5, 5, 3, 1, 1, 1, 1, 1, 4, 2, 4, 1, 2, 1, 4, 2, 3, 1, 4, 5, 3, 3, 2, 1, 1, 5, 4, 1, 1, 1,
         2, 1, 1, 5, 4, 5, 1, 3, 1, 1, 1, 1, 1, 1, 2, 1, 3, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1,
         1, 4, 5, 1, 3, 1, 4, 4, 2, 3, 4, 1, 1, 1, 5, 1, 1, 1, 4, 1, 5, 4, 3, 1, 5, 1, 1, 1, 1, 1, 5, 4, 1, 1, 1, 4, 3,
         1, 3, 3, 1, 3, 2, 1, 1, 3, 1, 1, 4, 5, 1, 1, 1, 1, 1, 3, 1, 4, 1, 3, 1, 5, 4, 5, 1, 1, 5, 1, 1, 4, 1, 1, 1, 3,
         1, 1, 4, 2, 3, 1, 1, 1, 1, 2, 4, 1, 1, 1, 1, 1, 2, 3, 1, 5, 5, 1, 4, 1, 1, 1, 1, 3, 3, 1, 4, 1, 2, 1, 3, 1, 1,
         1, 3, 2, 2, 1, 5, 1, 1, 3, 2, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 5, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1,
         1, 5, 5, 1].freeze

def hashify(array)
  { 0 => array.count(0),
    1 => array.count(1),
    2 => array.count(2),
    3 => array.count(3),
    4 => array.count(4),
    5 => array.count(5),
    6 => array.count(6),
    7 => array.count(7),
    8 => array.count(8) }
end

# p hashify(INPUT)

anglers = { 0 => hashify(INPUT) }
while anglers.keys.max < 256
  current_day = anglers.keys.max
  anglers_last_day = anglers[current_day]
  anglers[current_day + 1] = Hash.new(0)
  anglers_next_day = anglers[current_day + 1]
  anglers_last_day.each do |k, v|
    if k.positive?
      anglers_next_day[k - 1] += v
    else
      anglers_next_day[6] += v
      anglers_next_day[8] = v
    end
  end
end

p anglers[256].values.sum
