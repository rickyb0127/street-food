class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.update!(user_id: current_user.id, recipe_id: params[:recipe_id])
      flash[:notice] = "Comment was successfully created"
      redirect_to recipe_path(params[:recipe_id])
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @get_recipes = @comment.recipe_id
    flash[:notice] = "comment was deleted"
    redirect_to recipe_path(@get_recipes)
  end
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :recipe_id)
  end
end
