h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }

p h1
p h2
h1.merge(h2)
p h1
p h2

p h1
p h2
h1.merge!(h2)
p h1
p h2

# .merge! is a destructive method