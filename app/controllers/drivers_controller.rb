class DriversController < ApplicationController
  before_action :set_driver, only: %i[show edit update destroy]

  def index
    @drivers = Driver.all
  end

  def show
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to @driver, notice: 'Driver was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @driver.update(driver_params)
      redirect_to @driver, notice: 'Driver was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @driver.destroy
    redirect_to drivers_url, notice: 'Driver was successfully destroyed.'
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:first_name, :last_name, :license_number, :phone_number, :employment_date)
  end
end
