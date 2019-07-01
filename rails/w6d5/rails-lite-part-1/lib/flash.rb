require 'json'
require 'byebug'

class Flash
  attr_reader :now

  def initialize(req)
    cookie = req.cookies["_rails_lite_app_flash"]
    cookie ? @now = JSON.parse(cookie) : @now = {}     
    @flash = {}
  end

  def [](key)
    @now[key.to_s] || @flash[key.to_s]
  end

  def []=(key, value)
    @flash[key] = value
  end
  
  def store_flash(res)
    cookies_attributes = { path: '/', value: @flash.to_json }
    res.set_cookie("_rails_lite_app_flash", cookies_attributes)
  end
  
end
