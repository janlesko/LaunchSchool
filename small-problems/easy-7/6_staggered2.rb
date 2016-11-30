def staggered_case(string, non_alph = true)
  need_upcase = true
  result = ''
  string.chars.each do |char|
    if (char =~ /[^a-zA-Z]/) && non_alph
      result += char
      next
    elsif need_upcase
      result += char.upcase
    else
      result += char.downcase
    end
    need_upcase = !need_upcase
  end
  p result
end

p staggered_case('I Love Launch School!', non_alph = false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'