class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.integer :user_id
    end
  end
end
