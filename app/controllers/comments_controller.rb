
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @picture, notice: 'Comentario agregado con éxito.'
    else
      redirect_to @picture, alert: 'No se pudo agregar el comentario.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

