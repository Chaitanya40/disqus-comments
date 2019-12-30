class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
    	t.references :comment
    	t.references :user
    	t.text :reply_text
      t.timestamps
    end
  end
end
