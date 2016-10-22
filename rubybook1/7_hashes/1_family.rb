family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
          
pick = family.select { |m,n| m == :sisters || m == :brothers }

arr = pick.values.flatten

p arr

