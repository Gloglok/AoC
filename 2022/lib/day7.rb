require_relative "aoc"

class Day7 < AOC
  def solve(part:)
    # Maps the data into an array of user inputs with their results
    data = load_data.split("$ ")
      .map { |command| command.split("\n") }
    data.shift

    # Creates a tree of Folder7 and File7 objects from the cleaned up data
    build_tree(data)

    if part == 1
      Folder7.folders.sum do |folder|
        folder_size = folder.size
        (folder_size <= 100000) ? folder_size : 0
      end
    else
      space_to_free = 30000000 - (70000000 - Folder7.folders.first.size)
      Folder7.folders.sort_by(&:size).find { |folder| folder.size >= space_to_free }.size
    end
  end

  # The 2 #build_ methods are a bit ugly
  def build_tree(data)
    initialize_root

    data.each do |full_command|
      command = full_command.first
      case command
      when "cd .."
        Folder7.current_folder.cd_parent
      when "ls"
        # Fills the current folder with the result from "$ ls"
        build_folder_content(ls_results: full_command[1..])
      when /^cd \w/
        Folder7.current_folder.cd_child(name: command[3..])
      end
    end
  end

  def build_folder_content(ls_results:)
    ls_results.map { |child| child.split(" ") }.each do |child|
      if child[0].start_with?("dir") # -> folder
        Folder7.current_folder.create_subfolder(name: child[1])
      else # -> file
        Folder7.current_folder.create_file(name: child[1], size: child[0].to_i)
      end
    end
  end

  # Creates the top folder and sets it as the beginning point
  # (I removed the only "$ cd /" line from the input file)
  def initialize_root
    root = Folder7.new(name: "/")
    Folder7.folders << root
    Folder7.current_folder = root
  end
end

# This is prettier
class Folder7
  class << self
    attr_reader :folders
    attr_accessor :current_folder
  end
  @folders = []
  @current_folder = nil

  attr_reader :name, :parent, :child_folders, :child_files
  def initialize(name:, parent: nil)
    @name = name
    @parent = parent
    @child_folders = []
    @child_files = []
  end

  def create_subfolder(name:)
    subfolder = Folder7.new(name: name, parent: self)
    Folder7.folders << subfolder
    child_folders << subfolder
  end

  def cd_parent
    Folder7.current_folder = parent
  end

  def cd_child(name:)
    Folder7.current_folder = find_subfolder(name: name)
  end

  # Returns size of the current directory recursively
  def size
    child_folders.map { |folder| folder.size }.sum +
      child_files.map { |file| file.size }.sum
  end

  File7 = Struct.new(:name, :size)
  def create_file(name:, size:)
    child_files << File7.new(name, size)
  end

  private

  def find_subfolder(name:)
    child_folders.find { |folder| folder.name == name }
  end
end
