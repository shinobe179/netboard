class InterfacesController < ApplicationController
  def index
  end

  def show
    @interface = Interface.find(params[:id])
    @device = Device.find(@interface.device_id)
  end

  def new
    @interface = Interface.new
    @device_id = params[:device_id]
  end

  def edit
  end

  def create
    @interface = Interface.new(interface_params)

    respond_to do |format|
      if @interface.save
        format.html { redirect_to interface_url(@interface) }
        format.json { render :show, status: :created, location: @interface }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: interface.errors, status: unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  def peer_interfaces
    @target = params[:target]
    @interfaces = Interface.where(device_id: params[:device_id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
  def interface_params
    params.require(:interface).permit(:name, :description, :ipaddr, :device_id, :peer_interface_id)
  end
end