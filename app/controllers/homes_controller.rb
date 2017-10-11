class HomesController < ApplicationController

  def show
    @client_apps = ClientApp.all
  end

end
