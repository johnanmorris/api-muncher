class Recipe
  attr_reader :name, :image, :source, :url, :servings, :diet_labels, :calories, :ingredient_lines, :total_nutrients

  def initialize(name, info = {} )
    @name = name
    @image = info[:image]
    @source = info[:source]
    @url = info[:url]
    @servings = info[:servings]
    @diet_labels = info[:diet_labels]
    @calories = info[:calories]
    @ingredient_lines = info[:ingredient_lines]
    @total_nutrients = info[:total_nutrients]
  end

  def self.all(query)
    results = EdamamWrapper.all_results(query)
  end

end
