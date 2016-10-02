interface A do
  defines @a
  defines def a
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class User < ApplicationRecord
end

ApplicationRecord.new # => Explodes
User.new # => No explosion
