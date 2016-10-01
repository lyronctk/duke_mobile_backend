class Person
  @species = 'Homo Sapien'

  def self.species
    @species
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    # This is a global that'll get set on initialization
    $first_name = first_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

puts "Global isn't set: #{$first_name}"
faraz = Person.new('faraz', 'Yashar')
puts "Global is now set: #{$first_name}"
puts faraz.name
faraz.first_name = "Faraz"
puts faraz.name
puts Person.species


def faraz.hello_last_name
  "Hello #{@last_name}"
end
puts faraz.hello_last_name # => Hello Yashar


lyron = Person.new("Lyron", "CTK")
# puts lyron.hello_last_name # => Throws Error
