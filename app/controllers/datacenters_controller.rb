class DatacentersController < ApplicationController
  def index
    @datacenters = Datacenter.all
  end

  def show
    @datacenter = Datacenter.find(params[:id])
    @network_racks = NetworkRack.where(datacenter_id:params[:id])
  end

  def new
    @dc = Datacenter.new
  end

  def edit
    @dc = Datacenter.find(params[:id])
  end

  def create
    dc = Datacenter.new(datacenter_params)
    
    respond_to do |format|
      if dc.save
        format.html { redirect_to datacenter_url(dc) }
        format.json { render :show, status: :created, location: dc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: dc.errors, status: unprocessable_entity }
      end
    end
  end

  def update
    @dc = Datacenter.find(params[:id])

    respond_to do |format|
      if @dc.update(datacenter_params)
        format.html { redirect_to datacenter_url(@dc) }
        format.json { render :show, status: :created, location: @dc }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @dc.errors, status: unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  def datacenter_params
    params.require(:datacenter).permit(:name, :location)
  end
end
