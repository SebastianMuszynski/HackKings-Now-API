class RootController < ApplicationController

  def index
    paths  = [
      '/users',
      '/users/:user_id/events',
      '/users/:user_id/events/:event_id/notifications',
      '/users/:user_id/events/:event_id/messages'
    ]
    routes = paths.collect { |path| get_domain + path }
    render_json(routes)
  end

  private
  def get_domain
    request.protocol + request.host_with_port
  end

end
