class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :recipe
      t.string :ingredients
      t.integer :user_id
      
    end
  end
end
