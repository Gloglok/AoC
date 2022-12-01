class AOC
  def initialize(input_file:)
    @input_file = input_file
  end

  def load_data
    File.read(@input_file)
  end
end
