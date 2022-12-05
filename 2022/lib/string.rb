class String
  def split_into_n_equal_strings(n)
    self.chars.each_slice(self.length / n).map(&:join)
  end
end
