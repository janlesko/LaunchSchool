names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end


# expection handling is a structure used to handle the possibility of an error occuring in a program. It handles the error in a way that modifies the flow control of a program so that it doesn't stop and continue executing commands.

