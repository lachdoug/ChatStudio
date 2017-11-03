module ClientApps

  class ForksController < ApplicationController

    def new
      @client_app = ( current_user.client_apps.find(params[:client_app_id]) || ClientApp.where(id: params[:client_app_id]).published.first).dup
    end

    def create
      @client_app = ( current_user.client_apps.find(params[:client_app_id]) || ClientApp.where(id: params[:client_app_id]).published.first).dup
      sort_order = current_user.client_apps.sorted.first.sort_order - 1
      @client_app.assign_attributes(strong_params.merge({ published: false, sort_order: sort_order }))
      if @client_app.save
        render
      else
        render :new
      end
    end

    private

    def strong_params
      params.require(:client_app).permit(:name)
    end

  end

end
