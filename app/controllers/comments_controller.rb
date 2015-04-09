class CommentsController < ApplicationController
  def create
    yummly_api = YummlyAPI.new
    @get_recipes = yummly_api.get_recipes(params[:id])
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.update!(user_id: current_user.id, recipe_id: @recipe_id)
      flash[:notice] = "Comment was successfully created"
      redirect_to recipe_path(@recipe_id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :recipe_id)
  end
end
