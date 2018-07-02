class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.text :content
      t.text :blue
      t.text :red

      t.timestamps
    end
  end
end
