require "rails_helper"


describe "Question Attribute Requirements on Create", :type => :model do

  context "validation tests" do

    it "ensures the email is present when creating project" do

      question = Question.new(subject: "Subject", message: "Message")

      expect(question.valid?).to eq(false)

    end

    it "ensures the subject is present when creating question" do

      question = Question.new(email: "Email", message: "Message")

      expect(question.valid?).to eq(false)
  
    end

    it "ensures the message is present when creating question" do

      question = Question.new(email: "Email", subject: "Subject")

      expect(question.valid?).to eq(false)
  
    end

    it "should not be able to save question when email missing" do

      question = Question.new(subject: "Subject", message: "Message")

      expect(question.save).to eq(false)

    end

    it "should not be able to save question when subject missing" do

      question = Question.new(email: "Email", message: "Message")

      expect(question.save).to eq(false)

    end

    it "should not be able to save question when message missing" do

      question = Question.new(email: "Email", subject: "Subject")

      expect(question.save).to eq(false)

    end


    it "should be able to save project when have email, subject, and message" do

      question = Question.new(email: "Email", subject: "Subject", message: "Message")

      expect(question.save).to eq(true)

    end

  end

end