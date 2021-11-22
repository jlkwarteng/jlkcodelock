class PeopleController
  def initialize(params)
    @params = params
    @people = Person.people_from_data(params)
  end

  def normalize
    return @people
  end

  private

  attr_reader :params
end
