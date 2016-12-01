def swap_name(name)
  p name.split.reverse.join(', ')
end

swap_name('Joe Roberts') == 'Roberts, Joe'