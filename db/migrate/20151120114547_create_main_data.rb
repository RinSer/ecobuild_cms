class CreateMainData < ActiveRecord::Migration
  def change
    create_table :main_data do |t|
      t.string :title
      t.string :telephone
      t.string :address
      t.text :about

      t.timestamps null: false
    end
  end
end
