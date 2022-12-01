## AOC starting kit

A basic setup to start writing code to solve [AOC](adventofcode.com) challenges,
taken from https://github.com/Coderative/aoc-starting-kit.

It includes
- Convention for naming solution classes and where to store helper methods.
- `rake` task to generate answers directly from the command line.

## Setup

- `bundle install`
- `rake aoc:solve[1,1]` to run the solution for AOC 2022 Day 1 part 1.
- Write your own.

## Writing your solutions

- One file per day, e.g. `lib/day_1.rb`
- Name your classes `Day1`, `Day2`, etc.
- Make them inherit from the `AOC` where you can store any helper methods you
  will reuse for different challenges.
- Each `Day#` class should have an instance method `#solve` that accepts one
  argument : the part of the daily challenge
- Download your inputs into the `data` folder, e.g. `data/day1.txt`

## Running your solution

If you followed the conventions above, you can run the rake task
`rake aoc:solve[1,2]` to run your solution for the Day1, part 2.
(If using `zsh` you will need to escape the brackets `rake aoc:solve\[1,2\]`).