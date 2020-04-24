require_relative '../models/extinct_animals'


RSpec.describe ExtinctAnimals do
  let(:animal) { ExtinctAnimals.new }

  def check_animal(animal, expected_name, expected_group, expected_year_of_extinguishing)
    expect(animal.name).to eq expected_name
    expect(animal.group).to eq expected_group
    expect(animal.year_of_extinguishing).to eq expected_year_of_extinguishing
  end

  describe "attributes" do
    it "responds to animals" do
      expect(animal).to respond_to(:animals)
      animal.import_from_csv("animals.csv")
      animal_one = animal.animals[0]
      check_animal(animal_one, "Dodo","birds", "1662")
    end

    it "imports the 2nd animal" do
      animal.import_from_csv('animals.csv')
      animal_two = animal.animals[1]
      check_animal(animal_two, "Great Auk", "birds", "1844")
    end

     it "imports the 3rd animal" do
       animal.import_from_csv('animals.csv')
       animal_three = animal.animals[2]
       check_animal(animal_three, "Pyrenean Ibex", "mammals", "2000")
     end

     it "imports the 4th animal" do
       animal.import_from_csv('animals.csv')
       animal_four = animal.animals[3]
       check_animal(animal_four,"Stellers Sea Cow", "mammals", "1768")
     end

     it "imports the 5th animal" do
       animal.import_from_csv('animals.csv')
       animal_five = animal.animals[4]
       check_animal(animal_five,"Tasmanian Tiger", "mammals", "1936")
     end
    end


    it "initializes animals as an array" do
      expect(animal.animals).to be_an(Array)
    end

    it "initializes animals as empty" do
      expect(animal.animals.size).to eq(0)
    end

  describe "#add_animal" do
    it "adds only one animal to the extinct animals" do
      animal.add_animal('Black Rhino', 'mammals', '2011')

      expect(animal.animals.size).to eq(1)
    end

    it "adds the correct information to animals" do
      animal.add_animal('Black Rhino', 'mammals', '2011')
      new_animal = animal.animals[0]

      expect(new_animal.name).to eq('Black Rhino')
      expect(new_animal.group).to eq('mammals')
      expect(new_animal.year_of_extinguishing).to eq('2011')
    end
  end

   describe "#remove_animal" do
     it "remove  animal using name, group, and year of extinguishing" do
       animal.add_animal('Passenger Pigeon', 'bird', '1914')

       name = "Black Rhino"
       group = "mammals"
       year_of_extinguishing = "2011"
       animal.add_animal(name, group, year_of_extinguishing)

       expect(animal.animals.size).to eq(2)
       animal.remove_animal(name, group, year_of_extinguishing)
       expect(animal.animals.size).to eq(1)
       expect(animal.animals.first.name).to eq('Passenger Pigeon')
     end
   end

   describe "#import_from_csv" do
     it "imports the correct number of animals" do
       animal.import_from_csv("animals.csv")
       animal_size = animal.animals.size
       expect(animal_size).to eq 5
     end
   end
end
