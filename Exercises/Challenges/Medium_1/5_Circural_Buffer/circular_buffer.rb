# class CircularBuffer
#   class BufferEmptyException < StandardError; end
#   class BufferFullException < StandardError; end  
    
#   attr_reader :buffer
  
#   def initialize(size)
#     @buffer = Array.new(size) { Array.new }
#     @oldest = 0
#     @next = 0
#   end
  
#   def write(data)
#     raise BufferFullException, "Buffer is full" unless @buffer[@next].empty?
#     return if data == nil
#     @buffer[@next] << data
#     @next = increment(@next)
#   end
  
#   def write!(data)
#     return write(data) if @buffer[@next].empty?
#     return if data == nil
#     @buffer[@next] << data
#     @next = increment(@next)
#     @oldest = increment(@oldest)
#   end
  
#   def read
#     raise BufferEmptyException, "Buffer is empty" if @buffer[@oldest].empty?
#     value = @buffer[@oldest].pop
#     @oldest = increment(@oldest)
#     value
#   end
  
#   def clear
#     @buffer.each { |possition| possition.clear }
#     @oldest = 0
#     @next = 0
#   end
  
#   private
  
#   def increment(position)
#     (position + 1) % @buffer.size
#   end
# end

# class CircularBuffer
#   attr_reader :buffer
  
#   def initialize(max_size)
#     @buffer = []
#     @max_size = max_size
#   end
  
#   def read
#     value = @buffer.shift
#     raise BufferEmptyException unless value
#     value
#   end
  
#   def write(data)
#     raise BufferFullException if @buffer.size == @max_size
#     return if data.nil?
#     @buffer.push(data)
#   end
  
#   def write!(data)
#     return write(data) unless @buffer.size == @max_size
#     return if data.nil?
#     @buffer.shift
#     @buffer.push(data)
#   end
  
#   def clear
#     @buffer = []
#   end
  
#   class BufferFullException < Exception; end
#   class BufferEmptyException < Exception; end
# end

class CircularBuffer
  def initialize(max_size)
    @buffer = []
    @max_size = max_size
  end
  
  def read
    value = @buffer.shift
    raise BufferEmptyException unless value
    value
  end
  
  def write(data)
    update_buffer(data) { raise BufferFullException }
  end
  
  def write!(data)
    update_buffer(data) { @buffer.shift }
  end
  
  def clear
    @buffer = []
  end
  
  private
  
  def update_buffer(data)
    return if data.nil?
    yield if @buffer.size == @max_size
    @buffer << data
  end
  
  class BufferFullException < Exception; end
  class BufferEmptyException < Exception; end
end
