module Users

  class RegenerateApiTokensController < ApplicationController

    def new

    end

    def create
      if current_user.regenerate_api_token(strong_params[:password])
        redirect_to user_path(current_user)
      else
        render :new
      end
    end

    private

    def strong_params
      params.require(:user).permit(:password)
    end

  end

end
