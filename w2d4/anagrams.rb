def first_anagram?(first, second)
  first.chars.permutation(first.length).to_a.map{|x| x.join}.include?(second)
end

def second_anagram?(first, second)
  return false unless first.length == second.length
  first_arr = first.chars
  second_arr = second.chars

  first.length.times do
    letter = first_arr.first
    second_index = second_arr.index(letter)
    if second_index
      second_arr.delete_at(second_index)
      first_arr.shift
    else
      return false
    end
  end
  first_arr.empty? && second_arr.empty?
end

def third_anagram?(first, second)
  first.chars.sort == second.chars.sort
end

def fourth_anagram?(first, second)
  letters_hash = Hash.new(0)
  first.chars.each do |x|
    letters_hash[x] += 1
  end
  second.chars.each do |y|
    letters_hash[y] -= 1
  end
  letters_hash.values.all?(&:zero?)
end
