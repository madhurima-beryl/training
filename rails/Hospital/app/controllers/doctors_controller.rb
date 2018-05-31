class DoctorsController < ApplicationController
  # include DoctorsHelper   #makes the DoctorsHelper methods available to views for actions of the doctors controller.
  helper_method :sort_column, :sort_direction   #Declare a controller method as a helper.
                                                # The method helper_method is to explicitly share some methods defined in the controller to make them available for the view

  def index
    # debugger
    ##### HARDCODING SORTING ####### 
    case params[:id]
      when "doctor-id-asc"
        @doctors = Doctor.search(params[:search]).order("id").paginate(:per_page => 5, :page => params[:page])
      when "doctor-id-desc"
        @doctors = Doctor.search(params[:search]).order("id desc").paginate(:per_page => 5, :page => params[:page])
      when "doctor-name-asc"
        @doctors = Doctor.search(params[:search]).order("name").paginate(:per_page => 5, :page => params[:page])
      when "doctor-name-desc"
        @doctors = Doctor.search(params[:search]).order("name desc").paginate(:per_page => 5, :page => params[:page])
      when "doctor-ph-asc"
        @doctors = Doctor.search(params[:search]).order("ph_no").paginate(:per_page => 5, :page => params[:page])
      when "doctor-ph-desc"
        @doctors = Doctor.search(params[:search]).order("ph_no desc").paginate(:per_page => 5, :page => params[:page])
      when "doctor-salary-asc"
        @doctors = Doctor.search(params[:search]).order("salary").paginate(:per_page => 5, :page => params[:page])
      when "doctor-salary-desc"
        @doctors = Doctor.search(params[:search]).order("salary desc").paginate(:per_page => 5, :page => params[:page])
      when "doctor-spcl-asc"
        @doctors = Doctor.search(params[:search]).order("specialization_id").paginate(:per_page => 5, :page => params[:page])
        # name = Specialization.joins(:doctors).map(&:name, &:id).sort
        # @doctors = Doctor.all
      when "doctor-spcl-desc"
        @doctors = Doctor.search(params[:search]).order("specialization_id desc").paginate(:per_page => 5, :page => params[:page])
        # name = Specialization.joins(:doctors).map(&:name).sort.reverse
      else
        @doctors = Doctor.search(params[:search]).order("id").paginate(:per_page => 5, :page => params[:page])
    end

    ############# new way to access helpers' methods in controller ##########
    # @doctors = Doctor.all.order("#{helpers.sort_column} #{helpers.sort_direction}")
    
    ############# using loose coupling  ################
    # @doctors = Doctor.all.order(sort_column + ' ' + sort_direction)
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
