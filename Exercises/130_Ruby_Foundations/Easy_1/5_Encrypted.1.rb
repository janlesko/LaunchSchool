require 'pry'

def decrypt(encrypted)
  names = encrypted.split("\n")
  decrypted_list = []
  names.each do |name|
    decrypted_list << rotator(name)
  end
  decrypted_list.each { |name| puts name }
end

def rotator(name)
  alphabet = ('a'..'z').to_a
  decrypted_name = ""
  name.chars.each do |char|
    if alphabet.include?(char.downcase)
      index = alphabet.index(char.downcase)
      if char.downcase == char
        decrypted_name += alphabet.rotate(13)[index]
      else
        decrypted_name += alphabet.rotate(13)[index].upcase
      end
    else
      decrypted_name += char
    end
  end
  decrypted_name
end

encrypted = <<-NAMES
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unyog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Wbua Ngnanfbss
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
NAMES

decrypt(encrypted)