require "spec_helper"
RSpec.describe "Person Formatter" do
  describe "to format both  Dollar and Percentage Formatted Data" do
    let(:dollar_data) { [:dollar_format, "city $ birthdate $ last_name $ first_name\nLA $ 30-4-1974 $ Nolan $ Rhiannon\nNYC $ 5-1-1962 $ Bruen $ Rigoberto\n"] }
    let(:percentage_data) { [:percent_format, "city % birthdate % last_name % first_name\nLA % 30-4-1974 $ Nolan $ Rhiannon\nNYC % 5-1-1962 $ Bruen $ Rigoberto\n"] }

    it "formats Dollar Data" do
      formatted_data = PersonFormatter.new(dollar_data).format

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      puts formatted_data.inspect
      expect(formatted_data[0]).to be_a Person
    end

    it "formats Percentage Data" do
      formatted_data = PersonFormatter.new(percentage_data).format

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      puts formatted_data.inspect
      expect(formatted_data[0]).to be_a Person
    end
  end
end
