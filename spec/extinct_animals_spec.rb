require_relative '../models/extinct_animals'


RSpec.describe ExtinctAnimals do
  let(:list) { ExtinctAnimals.new }

  describe "attributes" do
    it "initializes animals as an array" do
      expect(list.animals).to be_an(Array)
    end

    it "initializes animals as empty" do
      expect(list.animals.size).to eq(0)
    end
  end

  describe "#add_animal" do
    it "adds only one animal to the extinct animals" do
      list.add_animal('Black Rhino', 'mammals', '2011')

      expect(list.animals.size).to eq(1)
    end

    it "adds the correct information to animals" do
      list.add_animal('Black Rhino', 'mammals', '2011')
      new_animal = list.animals[0]

      expect(new_animal.name).to eq('Black Rhino')
      expect(new_animal.group).to eq('mammals')
      expect(new_animal.year_of_extinguishing).to eq('2011')
    end
  end

  describe "#remove_animal" do
    it "remove  animal using name, group, and year of extinguishing" do
      list.add_animal('Passenger Pigeon', 'bird', '1914')

      name = "Black Rhino"
      group = "mammals"
      year_of_extinguishing = "2011"
      list.add_animal(name, group, year_of_extinguishing)

      expect(list.animals.size).to eq(2)
      list.remove_animal(name, group, year_of_extinguishing)
      expect(list.animals.size).to eq(1)
      expect(list.animals.first.name).to eq('Passenger Pigeon')
    end
  end

  describe "#import_from_csv" do
    it "imports the correct number of animals" do
      list.import_from_csv("animals.csv")
      list_size = list.animals.size
      expect(list_size).to eq 5
    end
  end


    def check_animal(animal, expected_name, expected_group, expected_year_of_extinguishing)
      expect(animal.name).to eq expected_name
      expect(animal.group).to eq expected_group
      expect(animal.year_of_extinguishing).to eq expected_year_of_extinguishing
    end

    describe "attributes" do
      it "responds to animals" do
        expect(list).to respond_to(:animals)
        list.import_from_csv("animals.csv")
        animal_one = list.animals[0]
        check_animal(animal_one, "Dodo", "birds", "1662")
      end

    it "imports the 2nd animal" do
      list.import_from_csv('animals.csv')
      animal_two = list.animals[1]
      check_animal(animal_two,"Great Auk","birds", "1844" )
    end

    it "imports the 3rd animal" do
      list.import_from_csv('animals.csv')
      animal_three = list.animals[2]
      check_animal(animal_three, "Pyrenean Ibex", "mammals", "2000" )
    end

    it "imports the 4th animal" do
      list.import_from_csv('animals.csv')
      animal_four = list.animals[3]
      check_animal(animal_four, "Stellers Sea Cow", "mammals", "1768")
    end

    it "imports the 5th animal" do
      list.import_from_csv('animals.csv')
      animal_five = list.animals[4]
      check_animal(animal_five, "Tasmanian Tiger", "mammals", "1936")
    end
  end

  describe "#binary_search" do
    it "searches ExtinctAnimals for a non-existent animal" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Suricate")
      expect(animal).to be_nil
    end

    it "searches ExtinctAnimals for a Dodo" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Dodo")
      expect(animal).to be_a Animal
      check_animal(animal, "Dodo","birds", "1662")
    end

    it "searches ExtinctAnimals for a Great Auk" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Great Auk")
      expect(animal).to be_a Animal
      check_animal(animal, "Great Auk", "birds", "1844")
    end

    it "searches ExtinctAnimals for a Pyrenean Ibex" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Pyrenean Ibex")
      expect(animal).to be_a Animal
      check_animal(animal, "Pyrenean Ibex", "mammals", "2000")
    end

    it "searches ExtinctAnimals for a Stellers Sea Cow" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Stellers Sea Cow")
      expect(animal).to be_a Animal
      check_animal(animal, "Stellers Sea Cow", "mammals", "1768")
    end

    it "searches ExtinctAnimals for Black Panter" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Black Panter")
      expect(animal).to be_nil
    end
  end

  describe "#iterative_search" do
    it "searches ExtinctAnimals for a non-existent animal" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Suricate")
      expect(animal).to be_nil
    end

    it "searches ExtinctAnimals for a Dodo" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Dodo")
      expect(animal).to be_a Animal
      check_animal(animal, "Dodo","birds", "1662")
    end

    it "searches ExtinctAnimals for a Great Auk" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Great Auk")
      expect(animal).to be_a Animal
      check_animal(animal, "Great Auk", "birds", "1844")
    end

    it "searches ExtinctAnimals for a Pyrenean Ibex" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Pyrenean Ibex")
      expect(animal).to be_a Animal
      check_animal(animal, "Pyrenean Ibex", "mammals", "2000")
    end

    it "searches ExtinctAnimals for a Stellers Sea Cow" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Stellers Sea Cow")
      expect(animal).to be_a Animal
      check_animal(animal, "Stellers Sea Cow", "mammals", "1768")
    end

    it "searches ExtinctAnimals for Black Panter" do
      list.import_from_csv("animals.csv")
      animal = list.binary_search("Black Panter")
      expect(animal).to be_nil
    end
  end


end
