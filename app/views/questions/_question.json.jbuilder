json.extract! question, :id, :email, :subject, :message, :created_at, :updated_at
json.url question_url(question, format: :json)
