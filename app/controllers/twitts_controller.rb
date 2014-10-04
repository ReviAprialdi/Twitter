class TwittsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_new_twitt, except: [:create, :update, :destroy]

  def index
    @twitts =  Twitt.all
  end

  def create
    @twitt = Twitt.new(params.require(:twitt).permit(:twitt))
    @twitt.user_id = current_user.id
    
    @twitt.save
    redirect_to twitts_path
  end

  def new
    
  end

  def edit
  end

  def show
    @twitts = Twitt.where(user_id: params[:id])
    render action: 'index'
  end

  def update
  end

  def destroy
  end
  
  def define_new_twitt()
    @twitt =  Twitt.new
  end
end
