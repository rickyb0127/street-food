class AddRecipeJsonToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :recipe_json, :json
  end
end
