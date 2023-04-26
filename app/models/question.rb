class Question < ApplicationRecord
    validates :email, :subject, :message, :presence => true
end
