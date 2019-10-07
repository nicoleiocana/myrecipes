require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "testname", email: "test@example.com")
    @recipe = Recipe.create!(name: "recipename", description: "recipedescription", chef_id: @chef.id)
    @recipe2 = @chef.recipes.build(name: "recipe2name", description: "recipe2description")
    @recipe2.save
  end
  
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
