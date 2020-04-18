class Animal
  attr_accessor :name, :group, :year_of_extinguishing

  def initialize(name, group, year_of_extinguishing)
    @name = name
    @group = group
    @year_of_extinguishing = year_of_extinguishing
  end

  def to_s
    "Name: #{name}\nGroup: #{group}\nYear of Extinguishing: #{year_of_extinguishing}"
  end
end
