module ClientApps

  class ServesController < ApplicationController

    skip_before_filter :verify_authenticity_token, only: [:create]

    def show
      @client_app = current_user.client_apps.find(params[:client_app_id]) || ClientApp.where(id: params[:client_app_id]).published.first
      render html: @client_app.source.to_s.gsub('__API_TOKEN__', current_user.api_token).html_safe
    end

  end

end
