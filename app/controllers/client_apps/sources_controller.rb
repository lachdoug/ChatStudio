module ClientApps

  class SourcesController < ApplicationController

    def show
      @client_app = current_user.client_apps.find(params[:client_app_id]) || ClientApp.where(id: params[:client_app_id]).published.first
    end

    def edit
      @client_app = current_user.client_apps.find( params[:client_app_id] )
    end

    def update
      @client_app = current_user.client_apps.find( params[:client_app_id] )
      if @client_app.update(strong_params)
        render
      else
        render :edit
      end
    end

    private

    def strong_params
      params.require(:client_app).permit(:source)
    end

  end

end
