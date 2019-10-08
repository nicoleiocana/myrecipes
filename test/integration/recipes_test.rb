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
    assert_select "a[href=?]", recipe_path(id: @recipe.id), text: @recipe.name
    assert_select "a[href=?]", recipe_path(id: @recipe2.id), text: @recipe2.name
  end
  
  test "should get recipes show" do
    get recipe_path(id: @recipe.id)
    assert_template 'recipes/show'
    assert_match @recipe.name, response.body
    assert_match @recipe.description, response.body
    assert_match @chef.chefname, response.body
  end
  
  test "create new valid recipe" do
    get new_recipe_path
    assert_template 'recipes/new'
    name_of_recipe = "chicken saute"
    description_of_recipe = "add chicken, add vegetables, cook for 20 mins, servce delicious meal"
    assert_difference 'Recipe.count', 1 do
      post recipes_path, params: {recipe: {name: name_of_recipe, description: description_of_recipe} }
    end
    follow_redirect!
    assert_match name_of_recipe.split.map(&:capitalize)*' ', response.body
    assert_match description_of_recipe.capitalize, response.body
  end
  
  test "reject invalid recipe submissions" do
    get new_recipe_path
    assert_template 'recipes/new'
    assert_no_difference 'Recipe.count' do
      post recipes_path, params: {recipe: {name: "", desciption: ""} }
    end
    assert_template 'recipes/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end
