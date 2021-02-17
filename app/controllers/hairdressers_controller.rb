class HairdressersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_hairdresser, only: [:edit, :show, :update, :destroy]
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
  end

  def edit
    unless @hairdresser.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @hairdresser.update(hairdresser_params)
      redirect_to @hairdresser
    else
      render :edit
    end
  end
  
  def destroy
    @hairdresser.destroy
    redirect_to root_path
  end

  private
  def hairdresser_params
    params.require(:hairdresser).permit(:name, :profile, :image).merge(user_id: current_user.id)
  end

  def set_hairdresser
    @hairdresser = Hairdresser.find(params[:id])
  end
end
