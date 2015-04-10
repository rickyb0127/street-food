

class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

  def create
    recipe_hash = eval(params[:shopping_list][:recipe_hash])
    @shopping_list = ShoppingList.new(params.require(:shopping_list).permit(:user_id))
    @shopping_list.recipe_hash = recipe_hash
    if @shopping_list.save
      flash[:notice] = "shopping list was successfully updated"
      redirect_to "/"
    else
      render :new
    end
  end
end
