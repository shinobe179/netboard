class NetworkRacksController < ApplicationController
  def index
    @racks = NetworkRack.all
  end

  def show
    @nwrack = NetworkRack.find(params[:id])
    @devices = Device.where(network_rack_id: params[:id])
    @dc = Datacenter.find(@nwrack.datacenter_id)
  end

  def new
    @rack = NetworkRack.new
    @dcid = params[:datacenter_id]
  end

  def edit
  end

  def create
    rack = NetworkRack.new(network_rack_params)
    
    respond_to do |format|
      if rack.save
        format.html { redirect_to network_rack_url(rack) }
        format.json { render :show, status: :created, location: rack }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: dc.errors, status: unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private
  def network_rack_params
    params.require(:network_rack).permit(:name, :height, :datacenter_id)
  end
end
