class RecipesController < ApplicationController
  def index
    yummly_api = YummlyAPI.new
    @recipes = yummly_api.recipes(params[:search])
  end
end
