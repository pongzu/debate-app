class AddPositionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :position, :string
  end
end
