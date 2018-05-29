class DoctorsController < ApplicationController
  # include DoctorsHelper   #makes the DoctorsHelper methods available to views for actions of the doctors controller.
  helper_method :sort_column, :sort_direction   #Declare a controller method as a helper.
                                                # The method helper_method is to explicitly share some methods defined in the controller to make them available for the view

  def index
    ##### HARDCODING SORTING ####### 
    # case params[:id]
    # when "doctor-name-asc"
    #   @doctors = Doctor.all.order("name")
    # when "doctor-name-desc"
    #   @doctors = Doctor.all.order("name desc")
    # else
    #   @doctors = Doctor.all.order("id")
    # end

    ############# new way to access helpers' methods in controller ##########
    # @doctors = Doctor.all.order("#{helpers.sort_column} #{helpers.sort_direction}")
    @doctors = Doctor.all.order(sort_column + ' ' + sort_direction)
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
    ["name", "ph_no","specialization_id", "salary"]
  end

  def sort_column
    # sortable_columns.include?(params[:column]) ? params[:column] : "name"
    Doctor.column_names.include?(params[:column]) ? params[:column] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
