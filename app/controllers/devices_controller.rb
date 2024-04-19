class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
    @device_type = DeviceType.find(@device.device_type_id).name
    @nwrack = NetworkRack.find(@device.network_rack_id)
    @dc = Datacenter.find(@nwrack.datacenter_id)
    @interfaces = Interface.where(device_id: params[:id])
  end

  def new
    @device = Device.new
  end

  def edit
    @device = Device.find(params[:id])
  end

  def create
    @device = Device.new(device_params)
    
    respond_to do |format|
      if @device.save
        format.html { redirect_to device_url(@device) }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: device.errors, status: unprocessable_entity }
      end
    end
  end

  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to device_url(@device) }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: device.errors, status: unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  def device_params
    params.require(:device).permit(:name, :description, :device_type_id, :network_rack_id)
  end
end
