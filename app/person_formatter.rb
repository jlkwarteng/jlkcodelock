class PersonFormatter
  FORMATTERS = { "percent_format": "%", 'dollar_format': "$" }
  CITIES = { "LA": "Los Angeles", "NYC": "New York City" }

  def initialize(data)
    puts "THIS IS DATA"
    puts data.inspect
    @key = data[0]
    @value = data[1]
  end

  def format
    lines = @value.split("\n")
    people = []
    heading = nil
    lines.each_with_index do |line, index|
      if index == 0
        heading = get_heading(line)
      else
        people << get_person(heading, line)
      end
    end
    return people
  end

  def get_heading(data)
    return data.split(FORMATTERS[@key]).map(&:strip)
  end

  def get_person(heading, data)
    person_details = data.split(FORMATTERS[@key]).map(&:strip)
    person = Person.new(first_name: person_details[heading.index("first_name")],
                        city: get_city(person_details[heading.index("city")]),
                        birthdate: person_details[heading.index("birthdate")])
    return person
  end

  def get_city(data)
    return CITIES[data.to_sym] if CITIES.keys.include?(data.to_sym)
    return data
  end
end
