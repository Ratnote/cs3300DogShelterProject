class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
