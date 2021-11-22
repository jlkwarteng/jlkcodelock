require "date"

class Person
  attr_reader :first_name, :city, :birthdate

  def initialize(first_name:, city:, birthdate:)
    @first_name = first_name
    @city = city
    @birthdate = birthdate
  end

  def self.people_from_data(data)
    format_keys = data.keys.grep(/_format$/)
    order_by = data[:order]
    data_to_format = data.slice(*format_keys)
    Person.data_to_people(data_to_format, order_by)
  end

  def birthdate
    Date.parse(@birthdate).strftime("%-m/%-d/%Y")
  end

  def self.data_to_people(data, order_by)
    people = []
    data.each do |da|
      people = people + PersonFormatter.new(da).format
    end

    return people.sort_by(&:first_name).map(&:to_s)
  end

  def to_s
    return "#{@first_name}, #{city}, #{birthdate}"
  end
end
