class RecipesController < ApplicationController
  def index
    yummly_api = YummlyAPI.new
    @recipes = yummly_api.recipes(params[:search])
  end

  def show
    yummly_api = YummlyAPI.new
    @get_recipes = yummly_api.get_recipes(params[:id])
    @get_recipes_hash = yummly_api.get_recipes_hash(params[:id])
    @comment = Comment.new
    @comments = Comment.all
    @shopping_list = ShoppingList.new
  end
end
