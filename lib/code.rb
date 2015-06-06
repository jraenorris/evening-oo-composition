#YOUR CODE GOES HERE
class Airplane

  attr_reader :contents

  def initialize(contents=nil)
    @contents = contents
  end

  def available_capacity
    @capacity = 20000
    return @capacity if contents == nil
    @capacity -= contents.total_weight
    @capacity
  end

  def can_fill?
    to_fill = available_capacity
    until to_fill <= 200
      to_fill -= 200
      ####################
    end
  end

end

class Container

  attr_reader :lbs_stored, :ingredient

  def initialize(ingredient, lbs_stored)
    @lbs_stored = lbs_stored
    @ingredient = ingredient
  end

  def num_of_containers
    capacity = 20 if ingredient == "cheesy poofs"
    capacity = 300 if ingredient == "brussels sprouts"
    @num_of_containers = lbs_stored / capacity
    @num_of_containers +=1 if lbs_stored % capacity != 0
    @num_of_containers
  end

  def total_weight
    container_weight = 50 if ingredient == "cheesy poofs"
    container_weight = 200 if ingredient == "brussels sprouts"
    @weight = lbs_stored + (num_of_containers * container_weight)
  end

end

class Ingredient

  attr_reader :type

  def initialize(type)
    @type = type
  end

  def units(weight_in_lbs)
    if type == "brussels sprouts"
      @units = weight_in_lbs * 22.679 #number of units / lb
    elsif type == "cheesy poofs"
      @units = weight_in_lbs * 907.184 #number of units / lb
    end
    @units
  end

end
