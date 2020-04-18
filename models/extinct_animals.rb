require_relative 'animal'
  class ExtinctAnimals
      attr_reader :animals

  def initialize
    @animals = []
  end

  def add_animal(name, group, year_of_extinguishing)
    index = 0
    animals.each do |a|
      if name < a.name
        break
      end
      index += 1
    end
    animals.insert(index, Animal.new(name, group, year_of_extinguishing))
  end
end
