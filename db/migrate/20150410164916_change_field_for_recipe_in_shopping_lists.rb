class ChangeFieldForRecipeInShoppingLists < ActiveRecord::Migration
  def change
    remove_column :shopping_lists, :recipe, :string
    remove_column :shopping_lists, :ingredients, :string
  end
end
