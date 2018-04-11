require 'test_helper'

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  test "should get a" do
    get animals_a_url
    assert_response :success
  end

  test "should get b" do
    get animals_b_url
    assert_response :success
  end

  test "should get index" do
    get animals_index_url
    assert_response :success
  end

end
