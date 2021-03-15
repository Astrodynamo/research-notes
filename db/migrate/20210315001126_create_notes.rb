class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.integer :topic_id
    end
  end
end
