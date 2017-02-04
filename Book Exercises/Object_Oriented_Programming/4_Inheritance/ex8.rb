bob = Person.new
bob.hi

# the problem is that "hi" method is not accessible to the object since it is private
# we can make the method public by moving it abot the "private" reserved word in the class
