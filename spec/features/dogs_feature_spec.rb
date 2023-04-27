require "rails_helper"
RSpec.feature "Dogs", type: :feature do
    context "Login" do
      scenario "should sign up" do
        visit root_path
        click_link 'Sign up'
        within("form") do
          fill_in "Email", with: "testing@test.com"
          fill_in "Password", with: "123456"
          fill_in "Password confirmation", with: "123456"
          click_button "Sign up"
        end
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end


      scenario "should log in" do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        expect(page).to have_content("Logged in")
      end
    end


    context "Update dog" do
      let(:dog) { Dog.create(name: "Test Name", age: 10, breed: "Test Breed", description: "Test Description") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_dog_path(dog)
      end
  
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Submit"
        expect(page).to have_content("Dog was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Submit"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Name", with: ""
        end
        click_button "Submit"
        expect(page).to have_content("Name can't be blank")
      end
    end

    context "Create dog" do
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_dog_path()
      end
  
   
        scenario "should be successful" do
          within("form") do
            fill_in "Name", with: "New Name"
            fill_in "Age", with: "10"
            fill_in "Breed", with: "New Breed"
            fill_in "Description", with: "New description content"
          end
          click_button "Submit"
          expect(page).to have_content("Dog was successfully created")
        end
   
   
        scenario "should fail" do
          within("form") do
            fill_in "Description", with: ""
          end
          click_button "Submit"
          expect(page).to have_content("Description can't be blank")
        end
  
        scenario "should fail" do
          within("form") do
            fill_in "Name", with: ""
          end
          click_button "Submit"
          expect(page).to have_content("Name can't be blank")
        end
    end
end