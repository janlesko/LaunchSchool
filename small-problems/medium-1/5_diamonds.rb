def diamonds(size)
  puts "#{" " *(size-3) + "*"*(size-4)}"
  puts "#{" " *(size-4) + "*"*(size-2)}"

  puts "#{"*"*size}"
  
  puts "#{" " *(size-4) + "*"*(size-2)}"
  puts "#{" " *(size-3) + "*"*(size-4)}"
end

diamonds(5)


