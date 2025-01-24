class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]


  def index
    @deliveries = Delivery.all
  end


  def new
    @delivery = Delivery.new
  end


  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      redirect_to @delivery, notice: 'Delivery was successfully created.'
    else
      render :new
    end
  end


  def show
  end


  def edit
  end


  def update
    if @delivery.update(delivery_params)
      redirect_to @delivery, notice: 'Delivery was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @delivery.destroy
    redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.'
  end

  private


  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:order_id, :vehicle_id, :driver_id, :delivery_date, :status)
  end
end
