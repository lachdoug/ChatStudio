module Servers
  module ChatStudio
    module Api
      module V0

        class RoomsController < ApplicationController
          respond_to :json
          # before_action :allow_cross_site_json_requests

          def index
            @rooms = Room.all.reverse
            respond_to do |format|
              format.json { render json: @rooms }
              format.html { render layout: false }
            end
          end

          def show
            @room = Room.find(params[:id])
            respond_to do |format|
              format.json { render json: @room.to_json(include: :messages) }
              format.html { render layout: false }
            end
          end

          def create
            @room = Room.new(strong_params.merge({user_id: current_user.id}))
            if @room.save
              render json: @room.to_json, status: 201
            else
              render json: { errors: @room.errors.full_messages }.to_json, status: 422
            end
          end

          private

          def strong_params
            params.require(:room).permit(:name)
          end

        end

      end
    end
  end
end
