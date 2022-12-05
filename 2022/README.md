## AOC starting kit

The setup was taken from https://github.com/Coderative/aoc-starting-kit.

I used:
- Naming conventions for classes and the helper methods storer.
- The `rake` task to generate answers directly from the command line.

## Setup

- `bundle install`
- `rake aoc:solve[1,1]` to run the solution for AOC 2022 Day 1 part 1.

## Writing the solutions

- One file per day, e.g. `lib/day_1.rb`
- Name the classes `Day1`, `Day2`, etc.
- Make them inherit from the `AOC` where are stored any helper methods reused
  for different challenges.
- Each `Day#` class should have an instance method `#solve` that accepts one
  argument : the part of the daily challenge
- Download the daily inputs into the `data` folder, e.g. `data/day1.txt`

## Running the solution

Following the conventions above, the rake task `rake aoc:solve[1,2]` will
run the solution for the Day1, part 2.
(If using `zsh` the brackets need to be escaped `rake aoc:solve\[1,2\]`).