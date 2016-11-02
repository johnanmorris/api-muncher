require 'test_helper'

class EdamamWrapperTest < ActiveSupport::TestCase
  test "app_key and app_id work properlty" do
    VCR.use_cassette("recipes") do
      app_id = ENV["EDAMAM_APP_ID"]
      app_key = ENV["EDAMAM_KEY"]
      url = "https://api.edamam.com/search?q=chicken&app_id=#{app_id}&app_key=#{app_key}"
      results = HTTParty.get(url).parsed_response
      puts "Got some results. Keys: #{results.keys}"
    end
  end

  test "self.all_results returns an array of Recipes" do

    # THIS IS FAILING BECAUSE OF COMPRESSED BODY. I'M GOING TO IGNORE IT FOR NOW, FOR MY OWN SANITY
    VCR.use_cassette("recipes") do
      recipes = EdamamWrapper.all_results("chocolate cheesecake graham cracker", 0, 10)
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      10.times do |i|
        assert_kind_of Recipe, recipes[i]
      end
      puts "Results: #{recipes.first.keys}"
    end
  end
end
