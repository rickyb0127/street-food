class AddRecipeHasToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :recipe_hash, :hstore, default: {}, null: false
  end
end
