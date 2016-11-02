class Recipe
  attr_reader :name

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
end
