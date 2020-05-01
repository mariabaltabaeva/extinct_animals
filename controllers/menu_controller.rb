require_relative '../models/extinct_animals'

class MenuController
  attr_reader :extinct_animals

  def initialize
    @extinct_animals = ExtinctAnimals.new
  end

  def main_menu
    puts "List of Animals - #{extinct_animals.animals.count} animals"
    puts "1 - View all animals"
    puts "2 - Create an animal"
    puts "3 - Search for an animal"
    puts "4 - Import animals from a csv_text"
    puts "5 - View animal by Number n"
    puts "6 - Exit"
    print "Enter your selection: "
    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_animals
        main_menu
      when 2
        system "clear"
        create_animal
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        system "clear"
        view_animal_num
        main_menu
      when 6
        puts "Done"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
      end
     end

     def view_all_animals
       extinct_animals.animals.each do |animal|
         system "clear"
         puts animal.to_s
         animal_submenu(animal)
       end

       system "clear"
       puts "End of List"
     end

     def create_animal
       system "clear"
       puts "New extinct animal"
       print "Name: "
       name = gets.chomp
       print "Group: "
       group = gets.chomp
       print "Year of Extinguishing: "
       year_of_extinguishing = gets.chomp
       extinct_animals.add_animal(name, group, year_of_extinguishing)

       system "clear"
       puts "New animal created"
     end

     def search_animals
       print "Search by name: "
       name =  gets.chomp
       match = extinct_animals.binary_search(name)
       system "clear"
       if match
         puts match.to_s
         search_submenu(match)
       else
         puts "No match found for #{name}"
       end
     end


     def view_animal_num
       system "clear"
       puts "Please choose number of animal in list"
       print "Number: "
       number = gets.chomp.to_i

       if number <= extinct_animals.animals.length
         puts "You chose: #{number}"
       else
         puts "You chose wrong number"
         sleep 3
         view_animal_num
       end
     end

     def animal_submenu(animal)
       puts "n - next animal"
       puts "d - delete animal"
       puts "e - edit this animal"
       puts "m - return to main menu"

       selection = gets.chomp

       case selection
       when "n"
       when "d"
         delete_animal(animal)
       when "e"
         edit_animal(animal)
         animal_submenu(animal)
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         animal_submenu(animal)
       end
     end

     def read_csv
       print "Enter CSV file to import: "
       file_name = gets.chomp

       if file_name.empty?
         system "clear"
         puts "No CSV file read"
         main_menu
       end

       begin
         animal_count = extinct_animals.import_from_csv(file_name).count
         systme "clear"
         puts "#{entry_count} new animals added from #{file_name}"
       rescue
         puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
         read_csv
     end
   end

     def delete_animal(animal)
       extinct_animals.animals.delete(animal)
       puts "#{animal.name} has been deleted"
     end

     def edit_animal(animal)
       print "Updated name: "
       name = gets.chomp
       print "Updated group: "
       group = gets.chomp
       print "Updated year_of_extinguishing: "
       year_of_extinguishing = gets.chomp
       animal.name = name if !name.empty?
       animal.group = group if !group.empty?
       animal.year_of_extinguishing = year_of_extinguishing if !year_of_extinguishing.empty?
       system "clear"
       puts "Updated animal: "
       puts animal
     end

     def search_submenu(animal)
       puts "\nd - delete entry"
       puts "e - edit this animal"
       puts "m - return to main menu"
       selection = gets.chomp
       case selection
       when "d"
         system "clear"
         delete_animal(animal)
         main_menu
       when "e"
         edit_animal(animal)
         system "clear"
         main_menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         puts animal.to_s
         search_submenu(animal)
       end
     end
   end
