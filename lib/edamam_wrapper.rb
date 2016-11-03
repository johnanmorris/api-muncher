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
    puts "first query: #{hits.first['recipe']['label']}"
    puts "Search term: #{search_term}"
    unless hits.empty?
      hits.each do |hit|
        recipe = hit["recipe"]
        wrapper = Recipe.new(recipe["label"], search_term, image: recipe["image"], source: recipe["source"],
                      url: recipe["url"], servings: recipe["yield"], diet_labels: recipe["dietLabels"],
                      calories: recipe["calories"], ingredient_lines: recipe["ingredientLines"],
                      total_nutrients: recipe["totalNutrients"])
        results << wrapper
      end
    end
    return results
  end
end
