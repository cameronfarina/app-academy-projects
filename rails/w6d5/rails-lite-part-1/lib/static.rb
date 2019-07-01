require 'byebug'

class Static
  attr_reader :app
  def initialize(app)
    @app = app
  end

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)
    path = req.path
    
    if path.include?('public')
      begin
        dot = File.dirname(__FILE__)
        updated_path = File.join(dot, '..', path)
        data = File.read(updated_path)
        res.write(data)
        res
      rescue 
        res = Rack::Response.new
        res = ["404", {'Content-type' => 'text/html'}, "File Not Found"]
      end
    end 
  end
  
end
