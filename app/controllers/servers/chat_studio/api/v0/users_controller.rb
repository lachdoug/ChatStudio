module Servers
  module ChatStudio
    module Api
      module V0

        class UsersController < ApplicationController

          def show
            respond_to do |format|
              format.json { render json: current_user }
              format.html { render layout: false }
            end
          end

        end

      end
    end
  end
end
