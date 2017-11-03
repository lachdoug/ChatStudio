module Servers
  module ChatStudio
    class RoomsController < ApplicationController

      # include ActionController::Live

      def new
        @room = Room.new
      end

      def create
        @room = Room.new(strong_params.merge({user_id: current_user.id}))
        if @room.save
          render
        else
          render :new
        end
      end

      private

      def strong_params
        params.require(:room).permit(:name)
      end

    end

  end
end
