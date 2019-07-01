require 'erb'
require 'byebug'
class ShowExceptions
  attr_reader :app
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      app.call(env)
    rescue 
      render_exception(env)
    end
  end

  private

  def render_exception(e)
    res = Rack::Response.new
    res = ["500", {'Content-type' => 'text/html'}, "RuntimeError"]  
  end

end
