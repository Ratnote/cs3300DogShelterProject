require "rails_helper"
RSpec.describe DogsController, :type => :controller do
    login_user

    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end
        context "GET #show" do
            let!(:dog) { Dog.create(name: "Test Name", age: 10, breed: "Test Breed", description: "Test Description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #update" do
            let!(:dog) { Dog.create(name: "Test Name", age: 10, breed: "Test Breed", description: "Test Description") }
            it "returns a success response" do
                dog.update(:name => "New Name")
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #create" do
            it "returns a success response" do
                Dog.create(name: "Test Name", age: 10, breed: "Test Breed", description: "Test Description")
                expect(response).to have_http_status(:ok)
            end
        end
    end
end