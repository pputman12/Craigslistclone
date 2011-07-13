class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :author
      t.string :title
      t.text :content
      t.string :picture

      t.timestamps
    end
  end
end
