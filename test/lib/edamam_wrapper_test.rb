require 'test_helper'

class EdamamWrapperTest < ActiveSupport::TestCase

  test "self.all_results returns an array of Recipes" do

    # THIS IS FAILING BECAUSE OF COMPRESSED BODY. I'M GOING TO IGNORE IT FOR NOW, FOR MY OWN SANITY
    VCR.use_cassette("recipes") do
      recipes = EdamamWrapper.all_results("chocolate cherry cheesecake graham cracker", 0, 1)
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      10.times do |i|
        assert_kind_of Recipe, recipes[i]
      end
    end
  end
end
