class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    # hash_key = ""
    # each_with_index { |el, idx| hash_key += idx.to_s + el.to_s }
    # hash_key.to_i
    each_with_index.inject(0) do |intermediate_hash, (el, i)|
      (el.hash + i.hash) ^ intermediate_hash
    end
  end
end

class String
  def hash
    # hash_key = ""
    # chars.each_with_index { |el, idx| hash_key += idx.to_s + el.ord.to_s }
    # hash_key.to_i
    chars.map(&:ord).hash
  end
end

class Hash
  def hash
    # hash_key = ""
    # sort.each { |k, v| hash_key += k.to_s + v.to_s }
    # hash_key.to_i
    to_a.sort_by(&:hash).hash
  end
end
