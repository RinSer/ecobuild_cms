class AddSubPicUrl < ActiveRecord::Migration
  def change
  	add_column :subcategories, :pic_url, :string
  end
end
