class EdamamWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]


  def self.all_results(query, from, to)
    url = BASE_URL + "?q=#{query}" + "&from=#{from}" + "&to=#{to}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    @data ||= HTTParty.get(url).parsed_response
    results = []
    hits = query["hits"]
    unless hits.empty?
      hits.each do |hit|
        recipe = hit["recipe"]
        wrapper = Recipe.new(recipe["label"], image: recipe["image"], source: recipe["source"],
                      url: recipe["url"], servings: recipe["yield"], diet_labels: recipe["dietLabels"],
                      calories: recipe["calories"], ingredient_lines: recipe["ingredientLines"],
                      total_nutrients: recipe["totalNutrients"])
        results << wrapper
      end
    end
    return results
  end
end
