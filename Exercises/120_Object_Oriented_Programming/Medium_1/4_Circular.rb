# class CircularQueue
#   def initialize(size)
#     @queue = Array.new(size, nil)
#     @oldest = nil
#   end
  
#   def enqueue(ele)
#     remove unless has_room?
#     @queue[nil_index] = ele
#   end
  
#   def dequeue
#     remove
#     @oldest
#   end
  
#   def remove
#     if empty?
#       @oldest = nil
#     else
#       @oldest = @queue.compact.min
#     end
#     @queue[@queue.index(@oldest)] = nil
#   end
  
#   def has_room?
#     @queue.include?(nil)
#   end
  
#   def nil_index
#     @queue.find_index { |ele| ele == nil }
#   end
  
#   def empty?
#     @queue.compact == []
#   end
# end

# require 'pry'

# class CircularQueue
#   def initialize(size)
#     @buffer = [nil] * size
#     @next_position = 0
#     @oldest_position = 0
#   end

#   def enqueue(object)
#     unless @buffer[@next_position].nil?
#       binding.pry
#       @oldest_position = increment(@next_position)
#     end
    
#     binding.pry
#     @buffer[@next_position] = object
#     @next_position = increment(@next_position)
#   end

#   def dequeue
#     value = @buffer[@oldest_position]
#     @buffer[@oldest_position] = nil
#     binding.pry
#     @oldest_position = increment(@oldest_position) unless value.nil?
#     value
#   end

#   private

#   def increment(position)
#     binding.pry
#     (position + 1) % @buffer.size
#   end
# end

class CircularQueue
  def initialize(size)
    @size = size
    @buffer = []
  end

  def enqueue(item)
    @buffer.unshift(item)
    @buffer.pop if @buffer.size > @size
  end

  def dequeue
    @buffer.pop
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil