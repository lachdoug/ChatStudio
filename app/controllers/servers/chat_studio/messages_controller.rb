module Servers
  module ChatStudio
    class MessagesController < ApplicationController

      # include ActionController::Live

      def new
        @message = Message.new
      end

      def create
        @message = Message.new(strong_params.merge({user_id: current_user.id}))
        if @message.save
          render
        else
          render :new
        end
      end

      private

      def strong_params
        params.require(:message).permit(:room_id, :body)
      end

    end

  end
end
