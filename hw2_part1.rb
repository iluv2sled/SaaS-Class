# metaprogramming to the rescue!

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')

    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(dest)
    dest = dest.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(dest)
      self / @@currencies[dest]
    end
  end
end

#puts 5.dollars.in(:euros)
#puts 10.euros.in(:rupees)

class String
  def palindrome?
    tmp = self.downcase.gsub(/[^a-z]/, "")
    tmp == tmp.reverse
  end
end

#puts "foo".palindrome?

module Enumerable
  def palindrome?
    self == self.reverse_each {|v| v}
  end
end
#puts [1,2,3,2,1].palindrome?
