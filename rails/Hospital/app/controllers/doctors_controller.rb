class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render "create"
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :ph_no, :specialization_id, :salary)
  end
end
