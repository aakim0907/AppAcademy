class Fixnum

end

class Array
  def hash
    each_with_index.inject(0) do |hashing, (el, i)|
      (el.hash + i.hash) ^ hashing
    end
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  def hash
    to_a.sort_by(&:hash).hash
  end
end
