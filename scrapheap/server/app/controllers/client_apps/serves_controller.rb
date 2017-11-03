module ClientApps

  class ServesController < ApplicationController

    def show
      @client_app = ClientApp.find( params[:client_app_id] )
      render html: @client_app.source.to_s.gsub('__API_TOKEN__', current_user.api_token).html_safe
    end

  end

end
