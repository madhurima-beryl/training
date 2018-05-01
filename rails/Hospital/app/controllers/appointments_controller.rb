class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    
    if @appointment.save
      redirect_to @appointment
    else 
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private
  def appointment_params
    params.require(:appointment).permit(:patients_id, :doctors_id, :date, :time)
  end
end
