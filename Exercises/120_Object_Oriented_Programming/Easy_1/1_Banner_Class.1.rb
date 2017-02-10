class Banner
  MAX_WIDTH = 80
  
  attr_accessor :message_array, :width
  
  def initialize(message, width = message.size)
    @width = width > MAX_WIDTH ? MAX_WIDTH : width
    @message_array = format_array(message.split, width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  
  def format_array(ary, width)
    result = []
    index = 1
    until ary.empty?
      limit = ary.take(index).join.size + index
      if limit > width
        result << ary.shift(index - 1)
        index = 1
      elsif limit == width
        result << ary.shift(index)
        index = 1
      end
      index += 1
    end
    result
  end

  def empty_line
    "| #{' ' * (width)} |"
  end

  def horizontal_rule
    "+-#{'-' * (width)}-+"
  end

  def message_line
    message_array.map! do |sub|
      "| " + sub.join(" ").center(width) + " |"
    end
    message_array.join("\n")
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 13)

puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

