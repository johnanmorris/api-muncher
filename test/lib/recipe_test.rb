require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "can be created with a name and uri" do
    name = "chicken pot pie"
    uri = "http://www.something.com/something"
    recipe = Recipe.new(name, uri)
    assert_equal recipe.name, name
    assert_equal recipe.uri, uri
  end

  test "Recipe can respond to all options" do
    name = "chicken pot pie"
    uri = "something something"
    recipe = Recipe.new(name, uri)
    options = [:name, :uri, :image, :source, :url, :servings,
                    :diet_labels, :calories, :ingredient_lines, :total_nutrients]
    options.each do |option|
      assert_respond_to recipe, option
    end
  end


  test "Recipe.all(query) should return an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all("chocolate cheesecake")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      10.times do |i|
        assert_kind_of Recipe, recipes[i]
      end
    end
  end
end
