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

  def show
    @hairdresser = Hairdresser.find(params[:id])
  end

  def edit
    @hairdresser = Hairdresser.find(params[:id])
    unless @hairdresser.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @hairdresser = Hairdresser.find(params[:id])
    if @hairdresser.update(hairdresser_params)
      redirect_to @hairdresser
    else
      render :edit
    end
  end

  private
  def hairdresser_params
    params.require(:hairdresser).permit(:name, :profile, :image).merge(user_id: current_user.id)
  end
end
