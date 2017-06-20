class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = selected_artwork
    if @artwork
      render json: @artwork
    else
      render json: ["Could not find artwork"], status: :not_found
    end
  end

  def update
    @artwork = selected_artwork
    if @artwork.update_attributes(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork = selected_artwork
    if @artwork
      @artwork.destroy
      render json: @artwork
    else
      render json: ["You can't delete me"], status: :not_found
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

  def selected_artwork
    Artwork.find_by(id: params[:id])
  end
end
