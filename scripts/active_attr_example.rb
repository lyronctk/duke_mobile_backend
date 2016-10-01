require 'active_attr'

class Person
  include ActiveAttr::Model

  attribute :first_name, type: String
  attribute :last_name, type: String
  attribute :age, type: Integer
end



p = Person.new

puts p.errors
