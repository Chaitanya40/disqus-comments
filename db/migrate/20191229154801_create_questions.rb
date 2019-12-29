class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
    	t.text :question_text
    	t.references :user
      t.timestamps
    end
  end
end
