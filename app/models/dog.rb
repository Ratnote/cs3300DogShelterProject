class Dog < ApplicationRecord
    validates :name, :age, :breed, :presence => true
end
