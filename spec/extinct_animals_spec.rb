require_relative '../models/extinct_animals'

RSpec.describe ExtinctAnimals do
  describe "attributes" do
    it "responds to animals" do
      animal = ExtinctAnimals.new
      expect(animal).to respond_to(:animals)
    end

    it "initializes animals as an array" do
      animal = ExtinctAnimals.new
      expect(animal.animals).to be_an(Array)
    end

    it "initializes animals as empty" do
      animal = ExtinctAnimals.new
      expect(animal.animals.size).to eq(0)
    end
  end

  describe "#add_animal" do
    it "adds only one animal to the extinct animals" do
      animal = ExtinctAnimals.new
      animal.add_animal('Black Rhino', 'mammals', '2011')

      expect(animal.animals.size).to eq(1)
    end

    it "adds the correct information to animals" do
      animal = ExtinctAnimals.new
      animal.add_animal('Black Rhino', 'mammals', '2011')
      new_animal = animal.animals[0]

      expect(new_animal.name).to eq('Black Rhino')
      expect(new_animal.group).to eq('mammals')
      expect(new_animal.year_of_extinguishing).to eq('2011')
    end
  end
end
