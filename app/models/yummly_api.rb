class YummlyAPI

  def initialize
    @conn = Faraday.new(:url => 'http://api.yummly.com')
  end

  def recipes(app_id, app_key)
    response = @conn.get do |req|
      req.url "/v1"
      req.headers['Content-Type'] = 'application/json'
      req.headers["X-Yummly-App-ID"] = app_id
      req.headers["X-Yummly-App-Key"] = app_key
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
