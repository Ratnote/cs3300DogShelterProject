require "rails_helper"
RSpec.describe QuestionsController, :type => :controller do
    login_user

    describe "test web requests e" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end
        context "GET #show" do
            let!(:question) { Question.create(email: "Email", subject: "Subject", message: "Message") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #update" do
            let!(:question) { Question.create(email: "Email", subject: "Subject", message: "Message") }
            it "returns a success response" do
                question.update(:email => "New email")
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #create for q" do
            it "returns a success response e" do
                Question.create(email: "Email", subject: "Subject", message: "Message")
                expect(response).to have_http_status(:ok)
            end
        end
    end
end