class WelcomeController < ApplicationController
  def index
    yummly_api = YummlyAPI.new
    @set_recipes = yummly_api.set_recipes
  end
end
