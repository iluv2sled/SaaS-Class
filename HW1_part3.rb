def combine_anagrams(words)
  h = Hash.new

  words.each do |word|
    sorted = word.downcase.scan(/./).sort.join
    puts sorted
    if(h.has_key?(sorted))
      puts "has key"
      h[sorted] = h[sorted].insert(h[sorted].length, word)
    else
      puts "no key"
      h[sorted] = Array.new(1,word)
    end
  end
  return h.values
end

words = ['cArs', 'for', 'hello', 'potatoes', 'HeLLo', 'racs', 'four', 'scar', 'creams', 'scream']
puts combine_anagrams(words)

