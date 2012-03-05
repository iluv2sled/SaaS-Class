class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}= (attr_name)
        if @attr_name_history == nil
          @attr_name_history = Array.new
          @attr_name_history[0] = nil
        end
        @attr_name_history[@attr_name_history.length] = attr_name
      end
    }
  end
end

class Foo
#def initialize()
#     @bar = nil
#  end

  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar = 2
f.bar_history # => if your code works, should be [nil,1,2]
