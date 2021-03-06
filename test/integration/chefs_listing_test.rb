require 'test_helper'

class ChefsListingTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "chef3", email: "chef3@example.com",
                                         password: "password",
                            password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "newchef2", email: "newchef2@example.com",
                                             password: "password",
                                password_confirmation: "password",
                                                admin: true)
  end
  
  test "should get chefs listing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chefname.split.map(&:capitalize)*' '
    assert_select "a[href=?]", chef_path(@chef2), text: @chef2.chefname.split.map(&:capitalize)*' '
  end
  
  test "should delete chef" do
    sign_in_as(@chef2, "password")
    get chefs_path
    assert_template 'chefs/index'
    assert_difference "Chef.count", -1 do
      delete chef_path(@chef)
    end
    assert_redirected_to chefs_path
    assert_not flash.empty?  
  end
  
end