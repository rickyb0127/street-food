class YummlyAPI

  def initialize
    @conn = Faraday.new(:url => "http://api.yummly.com/v1/api/recipes?_app_id=5b570d0a&_app_key=9f92ef3b82c056281393cbe1996ad439&q=street food")
  end

  def recipes(search)
    response = @conn.get do |req|
      req.url "http://api.yummly.com/v1/api/recipes?_app_id=5b570d0a&_app_key=9f92ef3b82c056281393cbe1996ad439&q=street food+#{search}"
      req.headers['Content-Type'] = 'application/json'
      req.headers['search'] = 'search'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
