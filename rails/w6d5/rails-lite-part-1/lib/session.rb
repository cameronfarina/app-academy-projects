require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies["_rails_lite_app"]
    if cookie 
      @session_cookie = JSON.parse(cookie)
    else
      @session_cookie = {}
    end
  end

  def [](key)
    @session_cookie[key]
  end

  def []=(key, val)
    @session_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookies_attribute = { path: '/', value: @session_cookie.to_json}
    res.set_cookie("_rails_lite_app", cookies_attribute )
  end
end


# NB: In order for this to work properly, the path and value keys in your hash must be symbols, not strings.