require "rails_helper"


describe "Dog Attribute Requirements on Create", :type => :model do

  context "validation tests" do

    it "ensures the name is present when creating project" do

      dog = Dog.new(age: 10, breed: "Breed", description: "Content of the description")

      expect(dog.valid?).to eq(false)

    end

    it "ensures the description is present when creating dog" do

      dog = Dog.new(name: "Name", age: 10, breed: "Breed")
  
      expect(dog.valid?).to eq(false)
  
    end

    it "ensures the age is present when creating dog" do

      dog = Dog.new(name: "Name", breed: "Breed", description: "Content of the description")
  
      expect(dog.valid?).to eq(false)
  
    end

    it "ensures the breed is present when creating dog" do

      dog = Dog.new(name: "Name", age: 10, description: "Content of the description")
  
      expect(dog.valid?).to eq(false)
  
    end

    it "should not be able to save dog when name missing" do

      dog = Dog.new(age: 10, breed: "Breed", description: "Content of the description")

      expect(dog.save).to eq(false)

    end

    it "should not be able to save dog when description missing" do

      dog = Dog.new(name: "name", age: 10, breed: "Breed")

      expect(dog.save).to eq(false)

    end

    it "should not be able to save dog when age missing" do

      dog = Dog.new(name: "name", breed: "Breed", description: "Content of the description")

      expect(dog.save).to eq(false)

    end

    it "should not be able to save dog when breed missing" do

      dog = Dog.new(name: "name", age: 10, description: "Content of the description")

      expect(dog.save).to eq(false)

    end

    it "should be able to save project when have name, age, breed, and description" do

      dog = Dog.new(name: "name", breed: "Breed", age: 10, description: "Content of the description")

      expect(dog.save).to eq(true)

    end

  end

end


describe "Dog Attribute Requirements on Edit", :type => :model do

  context "Edit dog" do 

    before (:each) do

      @dog = Dog.new(name: "name", breed: "Breed", age: 10, description: "Content of the description")

      end

    it "ensures the name is present when editing dog" do

      @dog.update(:name => "Replacement name")

      expect(@dog.name == "Replacement name")

    end

    it "ensures the description is present when editing dog" do

      @dog.update(:description => "Replacement description")

      expect(@dog.description == "Replacement description")
  
    end

    it "ensures the age is present when editing dog" do

      @dog.update(:age => 20)

      expect(@dog.age == 20)
  
    end

    it "ensures the breed is present when editing dog" do

      @dog.update(:breed => "Replacement breed")

      expect(@dog.breed == "Replacement breed")
  
    end

  end

end