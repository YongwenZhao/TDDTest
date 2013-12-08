class CommentsController < ApplicationController
  
  def create
    @show=Show.find_by_id(params[:show_id])
    @comment = @show.comments.create(params.require(:comment).permit(:content))
    @comment.time =Time.new
    @comment.save
    redirect_to show_path(@show)
  end

  def destroy
    @show=Show.find_by_id(params[:show_id])
    @show.comments.destroy(params[:id])
    redirect_to show_path(@show)
  end

  def new
  	@show=Show.find_by_id(params[:show_id])
  	@comment =@show.comments.build
  end

end
