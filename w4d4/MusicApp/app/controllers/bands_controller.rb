class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = selected_band
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = selected_band
    render :edit
  end

  def update
    @band = selected_band
    if @band.update_attributes(band_params)
      redirect_to band_url
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to edit_band_url
    end
  end

  def destroy
    @band = selected_band
    if @band
      @band.destroy
      redirect_to bands_url
    else
      flash.now[:errors] = ["You can't delete what you can't find!"]
    end
  end

  private

  def selected_band
    Band.find_by_id(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
