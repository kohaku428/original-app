class HairdressersController < ApplicationController
  def index
    @hairdressers = Hairdresser.all
  end

  def new
    @hairdresser = Hairdresser.new
  end

  def create
    @hairdresser = Hairdresser.new(hairdresser_params)
    if @hairdresser.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def hairdresser_params
    params.require(:hairdresser).permit(:name, :profile, :image).merge(user_id: current_user.id)
  end
end
