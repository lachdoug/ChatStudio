class ClientAppsController < ApplicationController

  def index
    # @client_apps = current_user.client_apps.sorted
    # byebug
  end

  def show
    @client_app = current_user.client_apps.find( params[:id] )
  end

  def new
    @client_app = current_user.client_apps.build
  end

  def create
    @client_app = current_user.client_apps.build(strong_params)
    sort_order = current_user.client_apps.sorted.first.sort_order - 1
    @client_app.assign_attributes(sort_order: sort_order)
    if @client_app.save
      redirect_to action: 'show', id: @client_app.id
    else
      render :new
    end
  end

  def edit
    @client_app = current_user.client_apps.find( params[:id] )
  end

  def update
    @client_app = current_user.client_apps.find( params[:id] )
    if @client_app.update(strong_params.merge({user_id: current_user.id}))
      redirect_to action: 'show'
    else
      render :edit
    end
  end

  def destroy
    @client_app = current_user.client_apps.find( params[:id] )
    @client_app.destroy
    redirect_to client_apps_path
  end

  def reorder
    reorder_strong_params[:client_apps_attributes].each do |n, client_app|
      # byebug
      @client_app = current_user.client_apps.find( client_app[:id] )
      @client_app.update(sort_order: client_app[:sort_order])
    end
    head :ok
  end

  private

  def strong_params
    params.require(:client_app).permit(:name, :description, :published)
  end

  def reorder_strong_params
    params.require(:user).permit(client_apps_attributes: [ :id, :sort_order ])
  end

end
