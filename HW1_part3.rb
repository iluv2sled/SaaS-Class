def combine_anagrams(words)
  h = Hash.new

  words.each do |word|
    sorted = word.scan(/./).sort.join
    if(h.has_key?(sorted))
      h[sorted] = h[sorted].insert(h[sorted].length, word)
    else
      h[sorted] = Array.new(1,word)
    end
  end
  return h.values
end

words = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
puts combine_anagrams(words)

