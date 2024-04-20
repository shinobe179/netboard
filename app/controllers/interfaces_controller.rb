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
  end

  def update
  end

  def destroy
  end

  def peer_interfaces
    @target = params[:target]
    @interfaces = Interface.where(device_id: params[:peer_device_id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
  def interface_params
    params.require(:interface).permit(:name, :description, :ipaddr, :device_id, :peer_interface_id)
  end
end