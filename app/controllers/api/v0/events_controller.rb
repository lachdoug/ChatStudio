module Api
  module V0

    class EventsController < ApplicationController

      include ActionController::Live
      # require 'reloader/sse'

      def show
        response.headers['Content-Type'] = 'text/event-stream'
        response.stream.write "event: subscribe\ndata: \n\n"

#         5.times do |n|
#           response.stream.write "event: looper\ndata: #{n}\n\n"
# p n
#           sleep 1
#         end

redis = Redis.new

# p "1."
            redis.subscribe(['message', 'heartbeat']) do |on|
# p "2."
              on.message do |event, data|
#                 # parsed_data = JSON.parse(data)
                response.stream.write "event: #{event}\ndata: #{data}\n\n"
# p "3." + data
              end
            end
          rescue IOError, ActionController::Live::ClientDisconnected
            
          ensure
            redis.quit
            response.stream.close
          # end
        # end

        head :no_content

      end


      private

    end

  end
end
