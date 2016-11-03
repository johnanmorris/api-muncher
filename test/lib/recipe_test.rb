require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "can be created with a name and uri" do
    name = "chicken pot pie"
    uri = "http://www.something.com/something"
    recipe = Recipe.new(name, uri)
    assert_equal recipe.name, name
    assert_equal recipe.uri, uri
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

  test "Recipe.find(uri, query) should find the recipe with the matching uri" do
    VCR.use_cassette("recipes") do
      query = "chocolate cheesecake"
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_74ff18665d4d7e0455b11e26d5d7fced"
      recipes = Recipe.all(query)
      result = Recipe.find(query, uri)
      assert_equal result.uri, uri
      assert_equal "http://cafefernando.com/chocolate-cheesecake/", result.url
    end
  end
end
