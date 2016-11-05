flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each.with_index { | v, i| hash[v] = i + 1 }

p hash