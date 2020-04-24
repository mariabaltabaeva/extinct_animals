require_relative 'animal'
 require "csv"

  class ExtinctAnimals
      attr_reader :animals

  def initialize
    @animals = []
  end

  def add_animal(name, group, year_of_extinguishing)
    index = 0
    @animals.each do |animal|
      if name < animal.name
        break
      end
      index += 1
    end
    animals.insert(index, Animal.new(name, group, year_of_extinguishing))
  end

  def remove_animal(name, group, year_of_extinguishing)
    delete_animal = nil
    @animals.each do |animal|
      if name == animal.name && group == animal.group && year_of_extinguishing == animal.year_of_extinguishing
        delete_animal = animal
      end
    end

    @animals.delete(delete_animal)
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      row_hash = row.to_hash
      add_animal(row_hash["name"], row_hash["group"], row_hash["year_of_extinguishing"])
    end
  end
end
