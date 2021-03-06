require 'reloader/sse'

class RefreshController < ApplicationController
  include ActionController::Live

  def index
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      directories = [File.join(Rails.root, 'db', 'data'),]
      fsevent = FSEvent.new

      # Watch the above directories
      fsevent.watch(directories) do |dirs|
        # Send a message on the "refresh" channel on every update
        sse.write({ :dirs => dirs }, :event => 'refresh')
      end
      fsevent.run

    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end
  end
end