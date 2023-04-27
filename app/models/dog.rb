class Dog < ApplicationRecord
    validates :name, :age, :breed, :description, :presence => true
end
