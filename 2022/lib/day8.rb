require_relative "aoc"

class Day8 < AOC
  def solve(part:)
    forest = load_data.split("\n").map { |line| line.chars.map(&:to_i) }
    forest_x, forest_y = forest.first.size, forest.size
    interior_trees = forest[1..forest_y - 2].map { |line| line[1..forest_x - 2] }

    if part == 1
      # Creates an array where every tree visibility is set to true by default
      forest_visibility = Array.new(forest_y) { Array.new(forest_x) { true } }

      # Updates the visibility of the interior trees
      interior_trees.each_with_index do |line, y|
        real_y = y + 1
        line.each_with_index do |tree_height, x|
          real_x = x + 1
          forest_visibility[real_y][real_x] = visible(tree_height: tree_height, x: real_x, y: real_y, forest: forest)
        end
      end
      return forest_visibility.flatten.count(true)
    else
      # Creates an array where every tree scenic score is set to 0 by default
      forest_scenic_scores = Array.new(forest_y) { Array.new(forest_x) { 0 } }

      # Updates the scenic score of the interior trees
      interior_trees.each_with_index do |line, y|
        real_y = y + 1
        line.each_with_index do |tree_height, x|
          real_x = x + 1
          forest_scenic_scores[real_y][real_x] = scenic_score(tree_height: tree_height, x: real_x, y: real_y, forest: forest)
        end
      end
      return forest_scenic_scores.flatten.max
    end
    nil
  end

  ##### PART 1 #####

  def visible(tree_height:, x:, y:, forest:)
    visible_from_left(tree_height: tree_height, x: x, y: y, forest: forest) ||
      visible_from_right(tree_height: tree_height, x: x, y: y, forest: forest) ||
      visible_from_top(tree_height: tree_height, x: x, y: y, forest: forest) ||
      visible_from_bottom(tree_height: tree_height, x: x, y: y, forest: forest)
  end

  def visible_from_left(tree_height:, x:, y:, forest:)
    forest[y][..x - 1].reduce(true) { |result, height| result && (height < tree_height) }
  end

  def visible_from_right(tree_height:, x:, y:, forest:)
    forest[y][x + 1..].reduce(true) { |result, height| result && (height < tree_height) }
  end

  def visible_from_top(tree_height:, x:, y:, forest:)
    forest[..y - 1].map { _1[x] }.reduce(true) { |result, height| result && (height < tree_height) }
  end

  def visible_from_bottom(tree_height:, x:, y:, forest:)
    forest[y + 1..].map { _1[x] }.reduce(true) { |result, height| result && (height < tree_height) }
  end

  ##### PART 2 #####

  def scenic_score(tree_height:, x:, y:, forest:)
    viewing_distance_left(tree_height: tree_height, x: x, y: y, forest: forest) *
      viewing_distance_right(tree_height: tree_height, x: x, y: y, forest: forest) *
      viewing_distance_top(tree_height: tree_height, x: x, y: y, forest: forest) *
      viewing_distance_bottom(tree_height: tree_height, x: x, y: y, forest: forest)
  end

  def viewing_distance_left(tree_height:, x:, y:, forest:)
    returned_value = forest[y][..x - 1].reverse.reduce(0) { |total, height|
      if height >= tree_height
        break total + 1
      end
      total + 1
    }
  end

  def viewing_distance_right(tree_height:, x:, y:, forest:)
    forest[y][x + 1..].reduce(0) { |total, height|
      if height >= tree_height
        break total + 1
      end
      total + 1
    }
  end

  def viewing_distance_top(tree_height:, x:, y:, forest:)
    forest[..y - 1].map { _1[x] }.reverse.reduce(0) { |total, height|
      if height >= tree_height
        break total + 1
      end
      total + 1
    }
  end

  def viewing_distance_bottom(tree_height:, x:, y:, forest:)
    forest[y + 1..].map { _1[x] }.reduce(0) { |total, height|
      if height >= tree_height
        break total + 1
      end
      total + 1
    }
  end
end
