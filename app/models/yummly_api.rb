class YummlyAPI

  def initialize
    @conn = Faraday.new(:url => "http://api.yummly.com/v1/api/recipes?_app_id=5b570d0a&_app_key=9f92ef3b82c056281393cbe1996ad439&q=street food")
  end

  def recipes(search)
    response = @conn.get do |req|
      req.url "http://api.yummly.com/v1/api/recipes?_app_id=5b570d0a&_app_key=9f92ef3b82c056281393cbe1996ad439&maxResult=200&start=1&q=street food+#{search}"
      req.headers['Content-Type'] = 'application/json'
      req.headers['search'] = 'search'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_recipes(recipe_id)
    response = @conn.get do |req|
      req.url "http://api.yummly.com/v1/api/recipe/#{recipe_id}?_app_id=5b570d0a&_app_key=9f92ef3b82c056281393cbe1996ad439"
      req.headers['Content-Type'] = 'application/json'
      req.headers['recipe_id'] = 'recipe_id'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_recipes_hash(recipe_id)
    response = @conn.get do |req|
      req.url "http://api.yummly.com/v1/api/recipe/#{recipe_id}?_app_id=5b570d0a&_app_key=9f92ef3b82c056281393cbe1996ad439"
      req.headers['Content-Type'] = 'application/json'
      req.headers['recipe_id'] = 'recipe_id'
    end
    JSON.parse(response.body, symbolize_names: true).select { |k,v| [:ingredientLines, :name].include?(k) }
  end

  def set_recipes
    response = @conn.get do |req|
      req.url "http://api.yummly.com/v1/api/recipes?_app_id=5b570d0a&_app_key=9f92ef3b82c056281393cbe1996ad439&maxResult=100&start=1"
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
