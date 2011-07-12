class AddCitiesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :city_id, :integer
  end
end
