class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to @picture, notice: 'Imagen subida con éxito.'
    else
      render :new, alert: 'No se pudo subir la imagen.'
    end
  end
  private

  def picture_params
    params.require(:picture).permit(:name, :content, :image)
  end
end