class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :img_url

      t.timestamps null: false
    end
  end
end
