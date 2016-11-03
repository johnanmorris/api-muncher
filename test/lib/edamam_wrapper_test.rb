require 'test_helper'

class EdamamWrapperTest < ActiveSupport::TestCase
  test "self.all_results returns an array of Recipes" do

    VCR.use_cassette("recipes") do
      recipes = EdamamWrapper.all_results("chocolate cheesecake graham cracker")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      10.times do |i|
        assert_kind_of EdamamWrapper, recipes[i]
      end
    end
  end
end
