class RemoveImgUrl < ActiveRecord::Migration
  def change
  	remove_column :subcategories, :img_url
  end
end
