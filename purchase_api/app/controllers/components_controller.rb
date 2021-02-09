class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :update, :destroy]

  # GET /components
  def index
    if params[:model]
      @components = Component.filtermodel(params[:model])
    elsif params[:type]
      @components = Component.where(:category => params[:type]) unless params[:category].blank?
    elsif params[:rgb]
      @components = Component.where(:rgb.to_s => params[:rgb].to_s) unless params[:rgb].blank?
    elsif params[:brand_id]
      @components = Component.where(:brand_id => params[:brand_id]) unless params[:brand_id].blank?
    else
      @components = Component.all
    end

    render json: @components
  end

  # GET /components/1
  def show
    render json: @component
  end

  # POST /components
  def create
    @component = Component.new(component_params)

    if @component.save
      render json: @component, status: :created, location: @component
    else
      render json: @component.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /components/1
  def update
    if @component.update(component_params)
      render json: @component
    else
      render json: @component.errors, status: :unprocessable_entity
    end
  end

  # DELETE /components/1
  def destroy
    @component.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component
      @component = Component.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def component_params
      params.require(:component).permit(:model, :category, :serial_number, :rgb, :brand_id)
    end
end
