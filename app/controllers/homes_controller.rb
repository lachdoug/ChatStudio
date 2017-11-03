class HomesController < ApplicationController

  def show
    @client_apps = ClientApp.published if current_user
  end

end
