class Bst
  attr_reader :data, :left, :right

  def initialize(top_number)
    @data = top_number
  end

  def insert(number)
    if number > data
      @right ? @right.insert(number) : @right = Bst.new(number)
    else
      @left ? @left.insert(number) : @left = Bst.new(number)
    end
  end

  def each(&block)
    return to_enum unless block_given?

    @left.each(&block) if @left
    yield(@data)
    @right.each(&block) if @right
  end
end