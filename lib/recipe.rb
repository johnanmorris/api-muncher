class Recipe
  attr_reader :name, :uri, :image, :source, :url, :servings, :diet_labels, :calories, :ingredient_lines, :total_nutrients

  def initialize(name, uri, info = {} )
    if name.nil? || name.empty? || uri.nil? || uri.empty?
      raise ArgumentError
    end
    @name = name
    @uri = uri
    @image = info[:image]
    @source = info[:source]
    @url = info[:url]
    @servings = info[:servings]
    @diet_labels = info[:diet_labels]
    @calories = info[:calories]
    @ingredient_lines = info[:ingredient_lines]
    @total_nutrients = info[:total_nutrients]
  end

  def self.all(query = nil)
    EdamamWrapper.all_results(query)
  end
end
