class Dessert
  def initialize(name, calories)
    @name = name
    @calories =calories
  end

  def calories
    @calories
  end

  def calories=(new_calories)
    @calories = calories
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def healthy?
    return @calories >= 200
  end

  def delicious
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def flavor
    return @flavor
  end

  def flavor=(new_flavor)
    @flavor = new_flavor
  end

  def delicious?
    if @flavor == "black licorice"
      return false
    else
      return true
    end
  end
end

