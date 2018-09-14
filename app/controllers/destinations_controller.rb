class DestinationsController < ApplicationController
  skip_before_action :authenticate, only: [:random]

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destinations_path
    else
      render :new
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    redirect_to destinations_path
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  def random
    @destination = Destination.all.shuffle
    render json: @destination
  end

  private

  def destination_params
    params.require(:destination).permit(:name,:description,:img_url,:latitude,:longitude)
  end


end
