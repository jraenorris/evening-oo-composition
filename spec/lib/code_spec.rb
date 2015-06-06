require_relative "../../lib/code"


describe Airplane do
  let(:empty_airplane) { Airplane.new }
  loading = Container.new("cheesy poofs", 5000)
  let(:loaded_airplane) {Airplane.new(loading) }

  describe "#available_capacity" do
    it "gives the capacity available when empty" do
      expect(empty_airplane.available_capacity).to eq(20000)
    end
    it "gives the capacity available when cheesy poofs are loaded" do
      expect(loaded_airplane.available_capacity).to eq(2500)
    end
  end
end

describe Container do
  let(:brussels_container) { Container.new("brussels sprouts", 500) }
  let(:poofs_container) { Container.new("cheesy poofs", 6000) }

  describe "#amount_stored" do
    it "gives the weight of the ingredient stored in it" do
      expect(brussels_container.lbs_stored).to eq(500)
    end
  end

  describe "#amount_stored" do
    it "calculates the number of containers needed to transport a given amount of brussels" do
      expect(brussels_container.num_of_containers).to eq(2)
    end
    it "calculates the number of containers needed to transport a given amount of poofs" do
      expect(poofs_container.num_of_containers).to eq(300)
    end
  end

  describe "#total_weight" do
    it "calculate the weight of the containers given #of containers and contents" do
      expect(brussels_container.total_weight).to eq(900)
    end
  end


end

describe Ingredient do
  let(:brussels) {Ingredient.new("brussels sprouts")}
  let(:poofs) {Ingredient.new("cheesy poofs")}

  describe "#type" do
    it "gives the name of the ingredient" do
      expect(brussels.type).to eq("brussels sprouts")
    end
  end

  describe "#weight_in_lbs" do
    it "gives the units of brussels based on weight" do
      expect(brussels.units(500)).to eq(11339.5)
    end
    it "gives the units of poofs based on weight" do
      expect(poofs.units(500)).to eq(453592)
    end
  end
end
