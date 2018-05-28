class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all#.order("#{sort_column} #{sort_direction}")
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render "new"
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
 
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    @doctors = Doctor.all
 
    #redirect_to doctors_path
  end

  def check_phone
    @doctor = Doctor.find_by_ph_no(params[:doctor][:ph_no])
    respond_to do |format|
    format.json { render :json => !@doctor }
  end

  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :ph_no, :specialization_id, :salary)
  end

  def sortable_columns
    ["name", ""]
  end

end
