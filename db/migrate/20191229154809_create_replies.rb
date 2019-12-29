class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
    	t.references :comment
    	t.references :user
      t.timestamps
    end
  end
end
