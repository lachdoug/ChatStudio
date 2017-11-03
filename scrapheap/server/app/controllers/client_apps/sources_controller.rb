module ClientApps

  class SourcesController < ApplicationController

    def edit
      @client_app = ClientApp.find( params[:client_app_id] )
    end

    def update
      @client_app = ClientApp.find( params[:client_app_id] )
      if @client_app.update(strong_params.merge({user_id: current_user.id}))
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
