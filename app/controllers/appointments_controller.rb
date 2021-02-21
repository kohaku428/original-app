class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_appointment = UserAppointment.new
  end

  def create
    @user_appointment = UserAppointment.new(appointment_params)
    if @user_appointment.valid?
      @user_appointment.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def appointment_params
    params.require(:user_appointment).permit(:full_name, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :day, :time).merge(user_id: current_user.id, hairdresser_id: params[:hairdresser_id])
  end

end
