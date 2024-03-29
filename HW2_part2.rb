class CartesianProduct
  include Enumerable
  
  def initialize(a, b)
    @cart = []
    a.each do |i|
      b.each do |j|
        @cart << [i,j]
     end 
    end
    puts @cart.length
  end

  def each
    @cart.each do |element|
      yield element
    end
  end
end

c = CartesianProduct.new([:a,:b, :c], [4,5])
c.each { |elt| puts elt.inspect }
#[:a, 4]
#[:a, 5]
#[:b, 4]
#[:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
