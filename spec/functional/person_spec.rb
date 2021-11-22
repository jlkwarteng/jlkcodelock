require "spec_helper"
RSpec.describe "Person" do
  describe "Functional Tests" do
    let(:person) { Person.new(first_name: "Jeremiah", city: "New York", birthdate: "20-05-1990") }

    it "formats bithdate correctly" do
      expect(person.birthdate).to eq "5/20/1990"
    end

    it "converts to string correctly" do
      expect(person.to_s).to eq "Jeremiah, New York, 5/20/1990"
    end
  end
end
