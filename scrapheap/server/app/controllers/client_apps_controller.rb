class ClientAppsController < ApplicationController

  def index
    @client_apps = ClientApp.all
  end

  def show
    @client_app = ClientApp.find( params[:id] )
  end

  def new
    @client_app = ClientApp.new
  end

  def create
    @client_app = ClientApp.new(strong_params.merge({user_id: current_user.id}))
    if @client_app.save
      redirect_to action: 'show'
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:client_app).permit(:name)
  end

end
