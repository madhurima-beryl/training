class DoctorsController < ApplicationController
  # include DoctorsHelper   #makes the DoctorsHelper methods available to views for actions of the doctors controller.
  helper_method :sort_column, :sort_direction   #Declare a controller method as a helper.
                                                # The method helper_method is to explicitly share some methods defined in the controller to make them available for the view

  def index
    ##### HARDCODING SORTING ####### 
    # @var = params[:search] if params[:search].present?
    # case params[:id]
    #   when "doctor-id-asc"
    #     @doctors = Doctor.search(params[:search]).order("id").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-id-desc"
    #     @doctors = Doctor.search(params[:search]).order("id desc").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-name-asc"
    #     @doctors = Doctor.search(params[:search]).order("name").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-name-desc"
    #     @doctors = Doctor.search(params[:search]).order("name desc").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-ph-asc"
    #     @doctors = Doctor.search(params[:search]).order("ph_no").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-ph-desc"
    #     @doctors = Doctor.search(params[:search]).order("ph_no desc").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-salary-asc"
    #     @doctors = Doctor.search(params[:search]).order("salary").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-salary-desc"
    #     @doctors = Doctor.search(params[:search]).order("salary desc").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-spcl-asc"
    #     # Doctor.joins(:specialization).where( specializations: {name: "heart"})        //selecting with a paticular spcl_name----using hash
    #     # Doctor.joins(:specialization).where( "specializations.name" =>  "heart")      //selecting with a paticular spcl_name----using string
    #     # sp_name = Specialization.joins(:doctors).map(&:name).sort                     //generates a sorted array of spcl_name present inside table 
    #     # Doctor.joins(:specialization).where( specializations: {name: sp_name})        //selecting-----using array
    #     # Doctor.joins(:specialization).where( specializations: {name: params[:specialization_name]})   //via parameter passing

    #     ###### sorting by specialization_name and doctor_id ######
    #     @doctors = Doctor.joins(:specialization).search(params[:search]).order("specializations.name","id").paginate(:per_page => 5, :page => params[:page])
    #   when "doctor-spcl-desc"
    #     @doctors = Doctor.joins(:specialization).search(params[:search]).order("specializations.name DESC", "id").paginate(:per_page => 5, :page => params[:page])
    #     # name = Specialization.joins(:doctors).map(&:name).sort.reverse                //reverse sort
    #   else
    #     @doctors = Doctor.search(params[:search]).order("id").paginate(:per_page => 5, :page => params[:page])
    # end

    ############# new way to access helpers' methods in controller ##########
    # @doctors = Doctor.all.order("#{helpers.sort_column} #{helpers.sort_direction}")
    
    ############# using loose coupling  ################
    if params[:column] == "specialization_id"
      @doctors = Doctor.joins(:specialization).search(params[:search]).order("specializations.name","id").paginate(:per_page => 5, :page => params[:page]) 
    else
      @doctors = Doctor.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    end
    @doc = Doctor.all
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
    if params[:column]== "specialization_id"
      params[:column] = "name"
    else
      # sortable_columns.include?(params[:column]) ? params[:column] : "name"
      Doctor.column_names.include?(params[:column]) ? params[:column] : "id"
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
