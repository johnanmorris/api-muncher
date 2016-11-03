require 'uri'

class EdamamWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]


  def self.all_results(query)
    url = BASE_URL + "?q=#{query}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data ||= HTTParty.get(url).parsed_response
    results = []
    hits = data["hits"]
    search_term = data["q"]
    unless hits.empty?
      hits.each do |hit|
        recipe = hit["recipe"]
        wrapper = Recipe.new(recipe["label"], recipe["uri"], image: recipe["image"], source: recipe["source"],
                      url: recipe["url"], servings: recipe["yield"], diet_labels: recipe["dietLabels"],
                      calories: recipe["calories"], ingredient_lines: recipe["ingredientLines"],
                      total_nutrients: recipe["totalNutrients"])
        results << wrapper

      end
    end
    return results
  end

  def self.find(uri)
    uri = URI.encode(uri)
    url = BASE_URL + "?r=#{uri}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data ||= HTTParty.get(url).parsed_response
    data = data[0]
    recipe = Recipe.new(data["label"], data["uri"], image: data["image"], source: data["source"],
                  url: data["url"], servings: data["yield"], diet_labels: data["dietLabels"],
                  calories: data["calories"], ingredient_lines: data["ingredientLines"],
                  total_nutrients: data["totalNutrients"])
    return recipe
  end
end
