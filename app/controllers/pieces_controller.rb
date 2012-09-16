class PiecesController < ApplicationController
  def index
    @markers = Piece.all.to_gmaps4rails
  end

  def new
    @piece = Piece.new
  end

  def edit
    @piece = Piece.find_by_id(params[:id])
  end

  def show
    @piece = Piece.find_by_id(params[:id])
  end

  def create
    @piece = Piece.new(params[:piece])

    if @piece.save
      redirect_to @piece, notice: 'Piece was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @piece = Piece.find_by_id(params[:id])

    if @piece.update_attributes(params[:piece])
      redirect_to @piece, notice: 'Piece was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @piece = Piece.find_by_id(params[:id])
    @piece.destroy

    redirect_to pieces_url
  end
end
