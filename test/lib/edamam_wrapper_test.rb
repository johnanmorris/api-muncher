require 'test_helper'

class EdamamWrapperTest < ActiveSupport::TestCase
  test "self.all_results returns an array of Recipes" do

    VCR.use_cassette("recipes") do
      recipes = EdamamWrapper.all_results("chocolate cheesecake graham cracker")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      10.times do |i|
        assert_kind_of Recipe, recipes[i]
      end
    end
  end

  test "self.find(uri) returns a single Recipe object" do
    VCR.use_cassette("recipes") do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_5aa8ce3aed2294da655465a983860794"
      result = EdamamWrapper.find(uri)
      assert_equal result.uri, uri
      assert_kind_of Recipe, result
      assert_equal "http://www.seriouseats.com/recipes/2013/08/mint-chocolate-chunk-cheesecake-bars.html", result.url
    end
  end
end
