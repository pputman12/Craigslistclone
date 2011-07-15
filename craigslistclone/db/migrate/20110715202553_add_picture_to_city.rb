class AddPictureToCity < ActiveRecord::Migration
  def change
    add_column :cities, :picture, :string
  end
end
