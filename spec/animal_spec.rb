require_relative '../models/animal'

RSpec.describe Animal do
  describe "attributes" do
    let(:animal) { Animal.new('Black Rhino', 'mammals', '2011')}

    it "responds to name" do
      expect(animal.name).to eq('Black Rhino')
    end

    it "responds to group" do
      expect(animal.group).to eq('mammals')
    end

    it "responds to year of extinguishing" do
      expect(animal.year_of_extinguishing).to eq('2011')
    end
  end

  describe "#to_s" do
    it "prints an animal as a string" do
      animal = Animal.new('Black Rhino', 'mammals', '2011')}
      expected_string = "Name: Black Rhino\nGroup: mammals\nYear of Extinguishing: 2011"
      expect(animal.to_s).to eq(expected_string)
    end
  end
end
