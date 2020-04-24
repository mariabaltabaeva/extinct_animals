require_relative 'controllers/menu_controller'

menu = MenuController.new

system "clear"
puts "List of extinct animals"
menu.main_menu
