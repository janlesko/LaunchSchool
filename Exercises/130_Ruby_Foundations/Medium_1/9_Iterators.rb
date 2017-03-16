factorial = Enumerator.new do |yielder|
  acc = 1
  num = 0
  loop do
    acc = num.zero? ? 1 : acc * num
    yielder << acc
    num += 1
  end
end

p factorial.take(6)

7.times { puts factorial.next }

factorial.rewind

7.times { puts factorial.next }

factorial.each_with_index do |num, idx|
  puts num
  break if idx == 6
end