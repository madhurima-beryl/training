class SpecializationsController < ApplicationController
  def index
    @specializations = Specialization.all 
  end

  def show
    @specialization = Specialization.find(params[:id])
  end

  def new
    @specialization = Specialization.new
  end

  def edit
    @specialization = Specialization.find(params[:id])
  end

  def create
    @specialization = Specialization.new(specialization_params)
    if @specialization.save
      redirect_to @specialization
    else
      render "new"
    end
  end

  def update
    @specialization = Specialization.find(params[:id])

    if @specialization.update(specialization_params)
      redirect_to @specialization
    end
  end

  def destroy
    @specialization = Specialization.find(params[:id])
    @specialization.destroy

    redirect_to specializations_path
  end

  private
  def specialization_params
    params.require(:specialization).permit(:name)
  end
end