class School
  # def initialize
  #   @roster = Hash.new { |roster, grade| roster[grade] = [] }
  # end

  # def add(student, grade)
  #   roster[grade] << student
  # end

  def initialize
    @list = Hash.new([])
  end

  def add(name, grade)
    @list[grade] += [name]
  end

  def grade(number)
    @list[number]
  end

  def to_h
    @list.sort.map { |grade, names| [grade, names.sort] }.to_h
  end
end