class AddCityToStory < ActiveRecord::Migration
  def change
    add_column :stories, :city_id, :integer
  end
end
