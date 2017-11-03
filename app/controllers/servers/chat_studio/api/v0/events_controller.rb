module Servers
  module ChatStudio
    module Api
      module V0

        class EventsController < ApplicationController

          include ActionController::Live

          def show
            response.headers['Content-Type'] = 'text/event-stream'
            response.stream.write "event: subscribe\ndata: \n\n"
            redis = Redis.new
            redis.subscribe(['message', 'heartbeat']) do |on|
              on.message do |event, data|
                response.stream.write "event: #{event}\ndata: #{data}\n\n"
              end
            end
          rescue IOError, ActionController::Live::ClientDisconnected
            puts "Close events"
          ensure
            redis.quit
            response.stream.close
            head :no_content
          end

        end

      end
    end
  end
end
