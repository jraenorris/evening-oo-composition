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
    capacity_left = available_capacity
    containers = 0
    until capacity_left <500
      capacity_left -= 500
      containers += 1
    end
    lbs_brussels_packed = (containers * 300) + capacity_left
    brussels_until_at_capacity = Ingredient.new("brussels sprouts")
    brussels_until_at_capacity = brussels_until_at_capacity.units(lbs_brussels_packed)
    "#{brussels_until_at_capacity.floor} units of brussels sprouts can be packed with #{contents.lbs_stored} lbs of cheesy poofs"
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

fivek_poofs = Container.new("cheesy poofs", 5000)
brussels_with_fivek_poofs = Airplane.new(fivek_poofs)
puts brussels_with_fivek_poofs.can_fill?

onek_poofs = Container.new("cheesy poofs", 1000)
brussels_with_onek_poofs = Airplane.new(onek_poofs)
puts brussels_with_onek_poofs.can_fill?
